variable "environment" {
  type    = string
  default = "development"
}

variable "aws_region" {
  type    = string
  default = "eu-west-3"
}

variable "domain_name" {
  type        = string
  description = "Name of the AWS Route53 hosted zone domain"
}

variable "subdomains" {
  description = "List of subdomains per environment"
  type        = list(string)
  default     = ["dev", ""]
}

variable "destination_email" {
  type = string
}

variable "ses_email_from" {
  type = string
}


