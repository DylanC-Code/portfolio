resource "aws_s3_bucket" "websites" {
  for_each = toset(var.subdomains)

  bucket        = each.value != "" ? "${each.value}.${var.domain_name}" : var.domain_name
  force_destroy = true

  tags = {
    Name        = "Portfolio ${each.value}"
    Environment = each.value
  }
}

resource "aws_s3_bucket_versioning" "versionning" {
  for_each = aws_s3_bucket.websites

  bucket = each.value.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  for_each                = aws_s3_bucket.websites
  bucket                  = each.value.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


resource "aws_s3_bucket_policy" "bucket_policy" {
  for_each = aws_s3_bucket.websites

  bucket = each.value.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn
        }
        Action   = "s3:GetObject"
        Resource = "${each.value.arn}/*"
      }
    ]
  })
}

# ==================================================
resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = "Access Identity for S3 portfolio"
}

resource "aws_cloudfront_distribution" "cdn" {
  origin {
    domain_name = aws_s3_bucket.websites[""].bucket_regional_domain_name
    origin_id   = "s3-portfolio"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
    }
  }


  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Distribution pour portfolio S3"
  default_root_object = "index.html"

  aliases = [
    for subdomain in var.subdomains :
    subdomain != "" ? "${subdomain}.${var.domain_name}" : var.domain_name
  ]

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "s3-portfolio"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  viewer_certificate {
    acm_certificate_arn      = var.certificate_arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2019"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = {
    Name = "Distribution for portfolio S3"
  }
}

resource "aws_route53_record" "dns" {
  for_each = aws_s3_bucket.websites
  zone_id  = var.zone_id
  name     = each.value.bucket
  type     = "A"

  alias {
    name                   = aws_cloudfront_distribution.cdn.domain_name
    zone_id                = aws_cloudfront_distribution.cdn.hosted_zone_id
    evaluate_target_health = false
  }
}
