resource "aws_route_table" "pub-route-table" {
  count = length(var.public-subnets) > 0 ? 1 : 0

  vpc_id = aws_vpc.vpc.id

  tags = merge(local.default_tags, tomap({ "Name" = "${local.naming-convention}-vpc-pub-route-table" }))
}

resource "aws_route_table" "priv-route-table" {
  count = length(var.priv-subnet) > 0 ? 1 : 0

  vpc_id = aws_vpc.vpc.id

  tags = merge(local.default_tags, tomap({ "Name" = "${local.naming-convention}-vpc-priv-route-table" }))
}