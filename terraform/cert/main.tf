provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

resource "aws_acm_certificate" "cert" {
  provider          = aws.us_east_1
  domain_name       = var.domain_name
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  subject_alternative_names = [
    for subdomain in var.subdomains :
    subdomain != "" ? "${subdomain}.${var.domain_name}" : var.domain_name
  ]

  tags = {
    Name = "Portfolio Cert"
  }
}

resource "aws_route53_record" "cert_record" {
  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      type   = dvo.resource_record_type
      record = dvo.resource_record_value
    }
  }

  zone_id         = var.zone_id
  name            = each.value.name
  type            = each.value.type
  records         = [each.value.record]
  ttl             = 60
  allow_overwrite = true

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    aws_acm_certificate.cert
  ]
}

resource "aws_acm_certificate_validation" "cert_validate" {
  provider        = aws.us_east_1
  certificate_arn = aws_acm_certificate.cert.arn

  validation_record_fqdns = [for record in aws_route53_record.cert_record : record.fqdn]

  depends_on = [
    aws_acm_certificate.cert,
    aws_route53_record.cert_record,
  ]
}
