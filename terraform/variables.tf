variable "s3_bucket_name" {
  type        = string
  description = "Name of the AWS s3 bucket who the static website will be stored"
}

variable "s3_domain_name" {
  type        = string
  description = "Name of the AWS Route53 hosted zone domain"
}

variable "aws_region" {
  type    = string
  default = "eu-west-3"
}
