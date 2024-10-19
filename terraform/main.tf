provider "aws" {}

locals {
  # full_domain = "${var.sub_domain}${var.domain_name}"
  # subdomain = var.subdomains
}

data "aws_route53_zone" "selected" {
  name         = var.domain_name
  private_zone = false
}

module "cert" {
  source      = "./cert"
  domain_name = var.domain_name
  zone_id     = data.aws_route53_zone.selected.zone_id
  sub_domain  = var.sub_domain
  environment = var.environment
}

module "s3_static_website_buckets" {
  source          = "./s3_static_website_buckets"
  bucket_name     = "${var.sub_domain}${var.domain_name}"
  zone_id         = data.aws_route53_zone.selected.zone_id
  s3_endpoint     = "s3-website.${var.aws_region}.amazonaws.com"
  environment     = var.environment
  sub_domain      = var.sub_domain
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

# module "cloud_front" {
#   source          = "./cloud_front"
#   domain_name     = var.domain_name
#   certificate_arn = module.cert.certificate_arn
#   zone_id         = data.aws_route53_zone.selected.zone_id
#   # api_id      = module.api_gateway.api_id
#   # environment = var.environment
# }
# module "route_53_records" {
#   source      = "./route_53_records"
#   api_id      = module.api_gateway.api_id
#   environment = var.environment
#   domain_name = var.domain_name
#   zone_id     = data.aws_route53_zone.selected.zone_id
# }

# module "api_gateway" {
#   source = "./api_gateway"
#   domain_name = var.domain_name
#   send_mail_lambda_function_name = module.lambda_send_mail.function_name
#   send_mail_lambda_arn = 
#   # send_mail_lambda_arn           = module.lambda_send_mail.arn
#   # send_mail_lambda_function_name = module.lambda_send_mail.function_name
#   # stage_name                     = var.environment
#   # domain_name                    = var.domain_name
# }


# resource "aws_route53_record" "static_website_record" {
#   zone_id = data.aws_route53_zone.selected.zone_id
#   name    = local.full_domain
#   type    = "A"

#   alias {
#     name                   = local.s3_endpoint
#     zone_id                = module.s3_static_website_buckets.hosted_zone_id
#     evaluate_target_health = true
#   }
# }





# module "api_gateway_route_53" {
#   source      = "./api_gateway_route_53"
#   domain_name = var.domain_name
#   zone_id     = data.aws_route53_zone.selected.zone_id
#   environment = var.environment
#   api_id      = module.lambda_api_gateway.api_id
# }
