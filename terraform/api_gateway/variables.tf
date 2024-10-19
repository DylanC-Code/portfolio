variable "send_mail_lambda_arn" {
  type = string
}

variable "send_mail_lambda_function_name" {
  type = string
}

variable "stage_name" {
  type    = string
  default = "dev"
}

variable "domain_name" {
  type = string
}

variable "certificate_arn" {
  type = string
}

variable "acm_certificate_validation" {
}

variable "zone_id" {
  type = string
}
