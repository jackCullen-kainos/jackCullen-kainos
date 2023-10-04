locals {
  default_tags = {
    project = var.project
    env     = var.env
  }

  bucket_name = "${var.project}-${var.env}-s3-tfstate"
}