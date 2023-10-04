resource "aws_eip" "nat" {
  count = var.ngw-count

  domain = "vpc"

  tags = merge(local.default_tags, tomap({ "Name" = "${local.naming-convention}-eip-${count.index}" }))

}