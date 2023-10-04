resource "aws_eip" "eip-a" {
  domain = "vpc"
}

resource "aws_eip" "eip-b" {
  domain = "vpc"
}