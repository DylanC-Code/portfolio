provider "aws" {}


data "aws_route53_zone" "selected" {
  name         = var.domain_name
  private_zone = false
}

module "cert" {
  source      = "./cert"
  domain_name = var.domain_name
  zone_id     = data.aws_route53_zone.selected.zone_id
  subdomains  = var.subdomains
  environment = var.environment
}

module "s3_static_website_buckets" {
  source          = "./s3_static_website_buckets"
  zone_id         = data.aws_route53_zone.selected.zone_id
  s3_endpoint     = "s3-website.${var.aws_region}.amazonaws.com"
  environment     = var.environment
  subdomains      = var.subdomains
  domain_name     = var.domain_name
  certificate_arn = module.cert.certificate_arn
}

module "lambda_send_mail" {
  source            = "./lambda_send_mail"
  domain_name       = var.domain_name
  destination_email = var.destination_email
  ses_email_from    = var.ses_email_from
}

module "api_gateway" {
  source                         = "./api_gateway"
  send_mail_lambda_arn           = module.lambda_send_mail.arn
  send_mail_lambda_function_name = module.lambda_send_mail.function_name
  stage_name                     = var.environment
  domain_name                    = var.domain_name
  certificate_arn                = module.cert.certificate_arn
  acm_certificate_validation     = module.cert.acm_certificate_validation
  zone_id                        = data.aws_route53_zone.selected.zone_id
}
