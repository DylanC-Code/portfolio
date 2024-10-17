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

resource "aws_iam_policy" "ses_send_email_policy" {
  name        = "ses_send_email_policy"
  description = "Policy to allow Lambda to send emails using SES"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "ses:SendEmail",
          "ses:SendRawEmail"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_ses_policy_attachment" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.ses_send_email_policy.arn
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "lambda_send_mail/sendmail.mjs"
  output_path = "lambda_send_mail/sendmail.lambda.zip"
}

resource "aws_lambda_function" "send_mail_function" {
  filename      = "lambda_send_mail/sendmail.lambda.zip"
  function_name = "send_mail_from_my_site"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "sendmail.sendmail"
  runtime       = "nodejs20.x"


  source_code_hash = data.archive_file.lambda.output_base64sha256

  environment {
    variables = {
      SES_EMAIL_FROM    = var.ses_email_from    # Remplace par ton email vérifié dans SES
      DESTINATION_EMAIL = var.destination_email # Remplace par ton email vérifié dans SES
      DOMAIN_NAME       = var.domain_name
    }
  }
}
