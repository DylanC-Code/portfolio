variable "bucket_name" {
  type        = string
  description = "Bucket name used for the AWS s3 bucket"
}

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
