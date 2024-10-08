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
