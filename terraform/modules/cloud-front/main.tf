data "aws_s3_bucket" "s3_bucket" {
  bucket = var.s3_bucket_id
}


################################################################################
# Create AWS Cloudfront distribution
################################################################################
resource "aws_cloudfront_origin_access_control" "cf-s3-oac" {
  name                              = "CloudFront S3 OAC ${var.s3_bucket_name}"
  description                       = "CloudFront S3 OAC ${var.s3_bucket_name}"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "cf-dist" {
  depends_on          = [origin_access_control.cf-s3-oac]
  enabled             = true
  default_root_object = "index.html"

  origin {
    domain_name              = data.aws_s3_bucket.s3_bucket.bucket_regional_domain_name
    origin_id                = var.s3_bucket_name
    origin_access_control_id = aws_cloudfront_origin_access_control.cf-s3-oac.id
  }

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = var.s3_bucket_name
    viewer_protocol_policy = "allow-all"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = var.certificate_arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }
}
