provider "aws" {}

# Main bucket
locals {
  s3_endpoint = "s3-website.${var.aws_region}.amazonaws.com"
}

module "s3_static_website_buckets" {
  source      = "./s3_static_website_buckets"
  bucket_name = var.s3_bucket_name
}

data "aws_route53_zone" "selected" {
  name         = var.s3_domain_name
  private_zone = false
}

resource "aws_route53_record" "static_website_record" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = var.s3_domain_name
  type    = "A"

  alias {
    name                   = local.s3_endpoint
    zone_id                = module.s3_static_website_buckets.hosted_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "www_static_website_record" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "www.${var.s3_domain_name}"
  type    = "A"

  alias {
    name                   = local.s3_endpoint
    zone_id                = module.s3_static_website_buckets.hosted_zone_id
    evaluate_target_health = true
  }
}
