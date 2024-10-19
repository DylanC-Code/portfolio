output "certificate_arn" {
  value = aws_acm_certificate_validation.cert_validate.certificate_arn
}

output "certicate_id" {
  value = aws_acm_certificate.cert.id
}

output "acm_certificate_validation" {
  value = aws_acm_certificate_validation.cert_validate
}
