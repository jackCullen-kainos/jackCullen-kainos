resource "aws_nat_gateway" "netgate-a" {
  subnet_id     = aws_subnet.pub-sub-a.id
  allocation_id = aws_eip.eip-a.id
  tags = {
    Name = "netgate-a"
  }
}

resource "aws_nat_gateway" "netgate-b" {
  subnet_id     = aws_subnet.pub-sub-b.id
  allocation_id = aws_eip.eip-b.id
  tags = {
    Name = "netgate-b"
  }

}