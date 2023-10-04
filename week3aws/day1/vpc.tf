# Create a VPC
resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "jc_vpc"
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = local.availability_zone

  tags = {
    name = "subnet-primdb-jc"
    Name = "subnet-primdb-jc"
  }

}

resource "aws_subnet" "private-subnet-2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "eu-west-1b"

  tags = {
    name = "subnet-secdb-jc"
    Name = "subnet-secdb-jc"
  }

}

resource "aws_db_subnet_group" "db-subnet-g" {

  name       = "jc-db-subnet-group"
  subnet_ids = [aws_subnet.private-subnet.id, aws_subnet.private-subnet-2.id]

}
resource "aws_subnet" "subnetinst" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
  availability_zone       = local.availability_zone

  tags = {
    Name = "Subnet-jc"
  }

}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "igw_jc"
  }
}

resource "aws_route_table" "rt_jc" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "rt_jc"
  }
}

resource "aws_route_table_association" "rta_jc" {
  subnet_id      = aws_subnet.subnetinst.id
  route_table_id = aws_route_table.rt_jc.id

}