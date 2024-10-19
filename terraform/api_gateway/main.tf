resource "aws_api_gateway_rest_api" "send_email_api" {
  name        = "Send Email API"
  description = "API for sending emails"
}

resource "aws_api_gateway_resource" "resource" {
  rest_api_id = aws_api_gateway_rest_api.send_email_api.id
  parent_id   = aws_api_gateway_rest_api.send_email_api.root_resource_id
  path_part   = "send-mail"
}

resource "aws_api_gateway_method" "post_method" {
  rest_api_id   = aws_api_gateway_rest_api.send_email_api.id
  resource_id   = aws_api_gateway_resource.resource.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "options_method" {
  rest_api_id   = aws_api_gateway_rest_api.send_email_api.id
  resource_id   = aws_api_gateway_resource.resource.id
  http_method   = "OPTIONS"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "post_integration" {
  rest_api_id             = aws_api_gateway_rest_api.send_email_api.id
  resource_id             = aws_api_gateway_resource.resource.id
  http_method             = aws_api_gateway_method.post_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.send_mail_lambda_arn

  depends_on = [
    aws_api_gateway_method.post_method,
    aws_api_gateway_method.options_method
  ]
}

resource "aws_api_gateway_integration" "options_integration" {
  rest_api_id             = aws_api_gateway_rest_api.send_email_api.id
  resource_id             = aws_api_gateway_resource.resource.id
  http_method             = aws_api_gateway_method.options_method.http_method
  integration_http_method = "OPTIONS"
  type                    = "MOCK"
}

resource "aws_api_gateway_method_response" "options_method_reponse" {
  resource_id = aws_api_gateway_resource.resource.id
  rest_api_id = aws_api_gateway_rest_api.send_email_api.id
  status_code = "200"
  http_method = aws_api_gateway_method.options_method.http_method
  response_models = {
    "application/json" = "Empty"
  }
  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = true,
    "method.response.header.Access-Control-Allow-Methods" = true,
    "method.response.header.Access-Control-Allow-Origin"  = true
  }
}

resource "aws_api_gateway_integration_response" "options_integration_response" {
  rest_api_id = aws_api_gateway_rest_api.send_email_api.id
  resource_id = aws_api_gateway_resource.resource.id
  http_method = aws_api_gateway_method.options_method.http_method
  status_code = aws_api_gateway_method_response.options_method_reponse.status_code

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'",
    "method.response.header.Access-Control-Allow-Methods" = "'GET,OPTIONS,POST,PUT'",
    "method.response.header.Access-Control-Allow-Origin"  = "'*'"
  }
  depends_on = [
    aws_api_gateway_integration.options_integration
  ]
}

resource "aws_lambda_permission" "api_gateway_invoke" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = var.send_mail_lambda_function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.send_email_api.execution_arn}/*/*"

}

resource "aws_api_gateway_deployment" "api_deployment" {
  rest_api_id = aws_api_gateway_rest_api.send_email_api.id
  stage_name  = var.stage_name

  depends_on = [
    aws_api_gateway_method.post_method,
    aws_api_gateway_method.options_method,
    aws_api_gateway_integration.post_integration,
    aws_api_gateway_integration.options_integration,
    aws_api_gateway_method_response.options_method_reponse
  ]
}

resource "aws_api_gateway_domain_name" "custom_domain" {
  domain_name     = var.domain_name
  certificate_arn = var.certificate_arn

  depends_on = [
    var.acm_certificate_validation
  ]
}

resource "aws_api_gateway_base_path_mapping" "api_mapping" {
  domain_name = var.domain_name
  api_id      = aws_api_gateway_rest_api.send_email_api.id
  stage_name  = var.stage_name

  base_path = ""

  depends_on = [
    aws_api_gateway_domain_name.custom_domain
  ]
}

resource "aws_route53_record" "api_gateway_alias" {
  zone_id = var.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = aws_api_gateway_domain_name.custom_domain.cloudfront_domain_name
    zone_id                = aws_api_gateway_domain_name.custom_domain.cloudfront_zone_id
    evaluate_target_health = false
  }

  depends_on = [
    aws_api_gateway_domain_name.custom_domain
  ]
}
