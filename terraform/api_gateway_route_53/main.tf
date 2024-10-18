provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

resource "aws_acm_certificate" "api_cert_us_east_1" {
  provider          = aws.us_east_1
  domain_name       = var.domain_name
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "API Gateway Cert us-east-1"
  }
}

resource "aws_route53_record" "cert_record" {
  allow_overwrite = true
  name            = tolist(aws_acm_certificate.api_cert_us_east_1.domain_validation_options)[0].resource_record_name
  records         = [tolist(aws_acm_certificate.api_cert_us_east_1.domain_validation_options)[0].resource_record_value]
  type            = tolist(aws_acm_certificate.api_cert_us_east_1.domain_validation_options)[0].resource_record_type
  zone_id         = var.zone_id
  ttl             = 300

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    aws_acm_certificate.api_cert_us_east_1
  ]
}

resource "null_resource" "delete_dns_first" {
  triggers = {
    cert_deleted = aws_acm_certificate.api_cert_us_east_1.id
  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo 'Deleting DNS records before ACM'"
  }

  depends_on = [aws_route53_record.cert_record]
}

resource "aws_acm_certificate_validation" "cert_validate" {
  provider                = aws.us_east_1
  certificate_arn         = aws_acm_certificate.api_cert_us_east_1.arn
  validation_record_fqdns = [aws_route53_record.cert_record.fqdn]

  depends_on = [
    aws_acm_certificate.api_cert_us_east_1,
    aws_route53_record.cert_record
  ]
}


resource "aws_api_gateway_domain_name" "custom_domain" {
  domain_name     = var.domain_name
  certificate_arn = aws_acm_certificate_validation.cert_validate.certificate_arn

  depends_on = [
    aws_acm_certificate_validation.cert_validate
  ]
}

resource "aws_route53_record" "api_gateway_alias" {
  zone_id = var.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = aws_api_gateway_domain_name.custom_domain.cloudfront_domain_name
    zone_id                = aws_api_gateway_domain_name.custom_domain.cloudfront_zone_id
    evaluate_target_health = false
  }

  depends_on = [
    aws_api_gateway_domain_name.custom_domain
  ]
}

resource "aws_api_gateway_base_path_mapping" "api_mapping" {
  domain_name = aws_api_gateway_domain_name.custom_domain.domain_name
  api_id      = var.api_id
  stage_name  = var.environment

  base_path = ""

  depends_on = [
    aws_api_gateway_domain_name.custom_domain
  ]
}

