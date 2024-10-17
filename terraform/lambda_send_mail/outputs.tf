output "arn" {
  value = aws_lambda_function.send_mail_function.invoke_arn
}

output "function_name" {
  value = aws_lambda_function.send_mail_function.function_name
}
