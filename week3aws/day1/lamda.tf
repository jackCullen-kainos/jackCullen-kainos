data "archive_file" "lambda" {
  type        = "zip"
  source_file = "pythonfile.py"
  output_path = "my-payload.zip"
}



resource "aws_iam_policy" "lambda-logging" {
    name = "jack-lambda-logging"
    path = "/"
    description = "IAM Policy for logging from a lambda function"

    policy = data.aws_iam_policy_document.allows3.json
  
}

resource "aws_iam_role_policy_attachment" "lambda-logs" {
    role = aws_iam_role.lambda-role.name
    policy_arn = aws_iam_policy.lambda-logging.arn

}  


resource "aws_iam_role" "lambda-role" {
    name = "jc-lambda-role"
    assume_role_policy = data.aws_iam_policy_document.assume_role.json
  
}

resource "aws_lambda_function" "lambda-py" {
  filename      = data.archive_file.lambda.output_path
  function_name = "lambda-jc-function"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "pythonfile.lambda_handler"

  source_code_hash = data.archive_file.lambda.output_base64sha256
  runtime          = "python3.9"

  environment {
    variables = {
      foo = "bar"
    }
  }
}

resource "aws_cloudwatch_log_group" "loggroupname" {
    name = "/aws/lambda/lambda-jc-function"
    retention_in_days = 14
  
}

resource "aws_lambda_permission" "allows3trigger" {
  statement_id  = "AllowExecutionFromS3"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda-py.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.bucket-jc.arn

}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.bucket-jc.bucket

  lambda_function {
    lambda_function_arn = aws_lambda_function.lambda-py.arn
    events              = ["s3:ObjectCreated:*"]
  }
}