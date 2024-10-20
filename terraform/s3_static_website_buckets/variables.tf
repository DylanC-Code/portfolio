variable "content_type_mapping" {
  description = "Mapping of files extensions to MIME contents"
  type        = map(string)
  default = {
    ".html" = "text/html"
    ".css"  = "text/css"
    ".js"   = "application/javascript"
    ".png"  = "image/png"
    ".jpg"  = "image/jpeg"
    ".jpeg" = "image/jpeg"
    ".gif"  = "image/gif"
    ".svg"  = "image/svg+xml"
    ".json" = "application/json"
    ".ico"  = "image/x-icon"
  }
}


variable "zone_id" {
  type = string
}

variable "s3_endpoint" {
  type = string
}

variable "environment" {
  type = string
}

variable "subdomains" {
  type = list(string)
}

variable "domain_name" {
  type = string
}

variable "certificate_arn" {
  type = string
}
