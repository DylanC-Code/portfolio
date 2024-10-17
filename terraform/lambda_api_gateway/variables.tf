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
