resource "aws_s3_bucket" "s3buc" {
  bucket = local.bucket_name

  tags = merge(local.default_tags, tomap({ "Name" = local.bucket_name }))

  lifecycle {
    prevent_destroy = true
    create_before_destroy = true
  }
}