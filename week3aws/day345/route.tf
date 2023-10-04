resource "aws_route_table" "route" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "Route-JC"
  }
}

resource "aws_route_table_association" "rta" {
  route_table_id = aws_route_table.route.id
  subnet_id      = aws_subnet.pub-sub-b.id
}

resource "aws_route_table_association" "rta2" {
  route_table_id = aws_route_table.route.id
  subnet_id      = aws_subnet.pub-sub-a.id
}

resource "aws_route_table" "nat-route-a" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.netgate-a.id
  }
}

resource "aws_route_table" "nat-route-b" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.netgate-b.id
  }
}

resource "aws_route_table_association" "nat-assoc-a" {
  subnet_id      = aws_subnet.priv-sub-a.id
  route_table_id = aws_route_table.nat-route-a.id
}

resource "aws_route_table_association" "nat-assoc-b" {
  subnet_id      = aws_subnet.priv-sub-b.id
  route_table_id = aws_route_table.nat-route-b.id
}