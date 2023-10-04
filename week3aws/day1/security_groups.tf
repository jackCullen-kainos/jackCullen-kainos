  resource "aws_security_group" "sg_jc" {
  name        = "allow internet traffic"
  description = "rukes for ssh and http"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = /*var.trusted_ips*/ ["0.0.0.0/0"]
  }


  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.trusted_ips
  }

  egress {
    description = "internet access"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


}

resource "aws_security_group" "sg_db_jc" {
  name        = "jack db sg"
  description = "rukes for ssh and http"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "mysql"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.sg_jc.id]
  }
}