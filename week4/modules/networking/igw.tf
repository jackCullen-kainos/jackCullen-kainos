resource "aws_internet_gateway" "igw" {
  count  = length(var.public-subnets) > 0 ? 1 : 0
  vpc_id = aws_vpc.vpc.id

  tags = merge(local.default_tags, tomap({ "Name" = "${local.naming-convention}-igw-${count.index}" }))
}