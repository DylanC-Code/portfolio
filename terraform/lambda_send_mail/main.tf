data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "lambda_send_mail/sendmail.ts"
  output_path = "sendmail.lambda.zip"
}

resource "aws_lambda_function" "send_mail_function" {
  function_name = "send_mail_from_my_site"
  filename      = "sendmail.lambda.zip"
  handler       = "index.sendmail"
  runtime       = "nodejs20.x"
  role          = aws_iam_role.iam_for_lambda.arn


  source_code_hash = data.archive_file.lambda.output_base64sha256

  environment {
    variables = {
      SES_EMAIL_FROM = "your-email@example.com" # Remplace par ton email vérifié dans SES
    }
  }
}
