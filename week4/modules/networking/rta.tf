resource "aws_route_table_association" "pub-rta" {
  count = length(aws_subnet.pubsub)

  subnet_id      = aws_subnet.pubsub[count.index].id
  route_table_id = aws_route_table.pub-route-table[0].id
}

resource "aws_route_table_association" "priv-rta" {
  count = length(aws_subnet.privsub)

  subnet_id      = aws_subnet.privsub[count.index].id
  route_table_id = element(aws_route_table.priv-route-table.*.id, count.index)
}