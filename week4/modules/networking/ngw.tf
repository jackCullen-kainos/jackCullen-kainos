resource "aws_nat_gateway" "ngw" {
  count = var.ngw-count

  allocation_id = aws_eip.nat[count.index].id
  subnet_id         = aws_subnet.pubsub[count.index].id

  tags = merge(local.default_tags, tomap({ "Name" = "${local.naming-convention}-ngw-${count.index}" }))

}