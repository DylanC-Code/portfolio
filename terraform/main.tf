provider "aws" {}

locals {
  s3_endpoint = "s3-website.${var.aws_region}.amazonaws.com"
  full_domain = "${var.sub_domain}${var.domain_name}"
}

module "s3_static_website_buckets" {
  source      = "./s3_static_website_buckets"
  bucket_name = local.full_domain
}

data "aws_route53_zone" "selected" {
  name         = var.domain_name
  private_zone = false
}

resource "aws_route53_record" "static_website_record" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = local.full_domain
  type    = "A"

  alias {
    name                   = local.s3_endpoint
    zone_id                = module.s3_static_website_buckets.hosted_zone_id
    evaluate_target_health = true
  }
}

module "lambda_send_mail" {
  source            = "./lambda_send_mail"
  domain_name       = var.domain_name
  destination_email = var.destination_email
  ses_email_from    = var.ses_email_from
}

module "lambda_api_gateway" {
  source                         = "./lambda_api_gateway"
  send_mail_lambda_arn           = module.lambda_send_mail.arn
  send_mail_lambda_function_name = module.lambda_send_mail.function_name
  stage_name                     = var.environment
}

module "api_gateway_route_53" {
  source      = "./api_gateway_route_53"
  domain_name = var.domain_name
  zone_id     = data.aws_route53_zone.selected.zone_id
  environment = var.environment
  api_id      = module.lambda_api_gateway.api_id
}
