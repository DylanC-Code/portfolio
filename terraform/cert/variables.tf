variable "domain_name" {
  type = string
}

variable "zone_id" {
  type = string
}

variable "subdomains" {
  type = list(string)
}

variable "environment" {
  type = string
}
