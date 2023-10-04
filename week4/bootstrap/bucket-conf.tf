resource "aws_s3_bucket_versioning" "enabled" {
    bucket = aws_s3_bucket.s3buc.id
    versioning_configuration {
      status = "Enabled"
    }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "default" {
    bucket = aws_s3_bucket.s3buc.id

    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
}

resource "aws_s3_bucket_public_access_block" "pub-access" {
    bucket = aws_s3_bucket.s3buc.id
    block_public_acls = true
    block_public_policy = true
    ignore_public_acls = true
    restrict_public_buckets = true
}

# resource "aws_s3_bucket_policy" "bucket-policy" {
#     bucket = aws_s3_bucket.s3buc.id 
#     policy = jsondecode({
#         Version = "2012-10-17"
#         Statement = [
#             {
#                 Sid = "AllowAccountUsersAccess",
#                 Effect = "Allow",
#                 Principal = {
#                     AWS = "arn:aws:iam::${var.accountid}:root"
#                 },
#                 Action = ["s3:GetObject", "s3:PutObject"],
#                 Resource = [
#                     "${aws_s3_bucket.s3buc.arn}/*"
#                 ]
#             }
#         ]
#     })
# }

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.s3buc.id 

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "AllowAccountUsersAccess",
        Effect = "Allow",
        Principal = {
          AWS = "arn:aws:iam::${var.accountid}:root"
        },
        Action = ["s3:GetObject", "s3:PutObject"],
        Resource = [
          "${aws_s3_bucket.s3buc.arn}/*"
        ]
      }
    ]
  })
}