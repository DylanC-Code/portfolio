output "website_output" {
  value = aws_s3_bucket_website_configuration.website.website_endpoint
}

output "hosted_zone_id" {
  value = aws_s3_bucket.bucket.hosted_zone_id
}
