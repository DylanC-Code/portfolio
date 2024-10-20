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

module "s3_dev" {
  source      = "./modules/s3-static-website"
  bucket_name = "dev.${var.domain_name}"
}

module "s3_prod" {
  source      = "./modules/s3-static-website"
  bucket_name = var.domain_name
}

module "cloud_front_prod" {
  source          = "./modules/cloud-front"
  s3_bucket_name  = var.domain_name
  s3_bucket_id    = module.s3_prod.static_website_id
  zone_id         = data.aws_route53_zone.selected.zone_id
  certificate_arn = module.cert.certificate_arn
}

module "s3_cf_policy_prod" {
  source                      = "./modules/s3-cf-policy"
  bucket_id                   = module.s3_prod.static_website_id
  bucket_arn                  = module.s3_prod.static_website_arn
  cloudfront_distribution_arn = module.cloud_front_prod.cloudfront_distribution_arn
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
