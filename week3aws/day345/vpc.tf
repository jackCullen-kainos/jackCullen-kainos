resource "aws_vpc" "vpc" {
  cidr_block = "192.0.0.0/16"
  tags = {
    Name = "vpc-jc"
  }
}