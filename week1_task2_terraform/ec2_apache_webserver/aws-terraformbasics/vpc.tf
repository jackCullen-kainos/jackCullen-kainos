resource "aws_vpc" "webserver_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "jc_vpc"
  }

}

resource "aws_subnet" "webserver_subnet" {
  vpc_id                  = aws_vpc.webserver_vpc.id
  cidr_block              = var.webserver_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = local.availability_zone

  tags = {
    Name = "webserver_subnet"
  }

}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.webserver_vpc.id

  tags = {
    Name = "webserver_igw"
  }

}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.webserver_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "webserver_pub_rt"
  }


}

resource "aws_route_table_association" "public_rt_association" {
  subnet_id      = aws_subnet.webserver_subnet.id
  route_table_id = aws_route_table.public_rt.id



}