resource "aws_s3_bucket" "bucket" {
  bucket        = var.bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.bucket.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket                  = aws_s3_bucket.bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.id
  policy = templatefile("./s3_static_website_buckets/s3-policy.json", { bucket : var.bucket_name })
}

resource "aws_s3_bucket_versioning" "versionning" {
  bucket = aws_s3_bucket.bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_object" "upload" {
  for_each = fileset("../build/", "*")

  bucket       = aws_s3_bucket.bucket.id
  key          = each.value
  source       = "../build/${each.value}"
  content_type = lookup(var.content_type_mapping, lower(regex("(\\.[^.]+)$", each.value)[0]), "binary/octet-stream")
}

resource "aws_s3_bucket" "www_bucket" {
  bucket        = "www.${var.bucket_name}"
  force_destroy = true
}

resource "aws_s3_bucket_website_configuration" "name" {
  bucket = aws_s3_bucket.www_bucket.id

  redirect_all_requests_to {
    host_name = var.bucket_name
  }
}

resource "aws_s3_bucket_public_access_block" "www_public_access_block" {
  bucket = aws_s3_bucket.www_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "www_bucket_policy" {
  bucket = aws_s3_bucket.www_bucket.id
  policy = templatefile("./s3_static_website_buckets/s3-policy.json", { bucket : "www.${var.bucket_name}" })
}
