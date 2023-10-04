resource "aws_route" "igw-route" {
  count = length(var.public-subnets) > 0 ? 1 : 0

  route_table_id         = aws_route_table.pub-route-table[0].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw[count.index].id
}

resource "aws_route" "nat-route" {
  count = var.ngw-count

  route_table_id         = aws_route_table.priv-route-table[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.ngw[count.index].id
}