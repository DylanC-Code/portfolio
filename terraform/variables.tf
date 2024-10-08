variable "s3_bucket_name" {
  type        = string
  description = "Name of the AWS s3 bucket who the static website will be stored"
}

variable "domain_name" {
  type        = string
  description = "Name of the AWS Route53 hosted zone domain"
}

variable "sub_domain" {
  type    = string
  default = ""
}

variable "aws_region" {
  type    = string
  default = "eu-west-3"
}
