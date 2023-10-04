data "aws_iam_policy_document" "allows3" {
  version = "2012-10-17"

  statement {

    effect = "Allow"

    actions = [
      "logs:PutLogEvents",
      "logs:CreateLogGroup",
      "logs:CreateLogStream"
    ]

    resources = [
      "arn:aws:logs:*:*:*"
    ]
  }

  statement {

    effect = "Allow"

    actions = [
      "s3:GetObject"
    ]

    resources = [
      "${aws_s3_bucket.bucket-jc.arn}",
      "${aws_s3_bucket.bucket-jc.arn}/*"
    ]
  }
}


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
  name               = "jc-lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}



resource "aws_iam_policy" "iampolicylamda" {
  name   = "lamdapolicyname-jc"
  policy = data.aws_iam_policy_document.allows3.json

}


resource "aws_iam_role_policy_attachment" "lamda-policy-attach" {
  policy_arn = aws_iam_policy.iampolicylamda.arn
  role       = aws_iam_role.iam_for_lambda.name

}


# resource "aws_s3_bucket_policy" "bucket-policy" {
#   bucket = aws_s3_bucket.bucket-jc.id
#   policy = data.aws_iam_policy_document.allows3.json

# }

resource "aws_s3_bucket" "bucket-jc" {
  bucket = "bucket-mise-buicead"
}