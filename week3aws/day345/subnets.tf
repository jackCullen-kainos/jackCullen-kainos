resource "aws_subnet" "priv-sub-a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "192.0.1.0/24"
  availability_zone = "${var.region}a"
  tags = {
    Name = "priv-subnet-a-jc"
  }
}

resource "aws_subnet" "pub-sub-a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "192.0.2.0/24"
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true
  tags = {
    Name = "pub-subnet-a-jc"
  }
}

resource "aws_subnet" "priv-sub-b" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "192.0.3.0/24"
  availability_zone = "${var.region}b"
  tags = {
    Name = "priv-subnet-b-jc"
  }
}

resource "aws_subnet" "pub-sub-b" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "192.0.4.0/24"
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = true
  tags = {
    Name = "pub-subnet-b-jc"
  }
}
resource "aws_db_subnet_group" "db-subnet-group" {
  name       = "db-subnet-group-jc"
  subnet_ids = [aws_subnet.priv-sub-b.id, aws_subnet.priv-sub-a.id]

}