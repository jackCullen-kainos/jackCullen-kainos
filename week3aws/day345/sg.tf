resource "aws_security_group" "sg" {
  name        = "allow internet traffic"
  description = "rules for ssh and http"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0", "192.0.1.0/24", "192.0.3.0/24"]
  }
}

resource "aws_security_group" "conn" {
  name   = "traffic out"
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["192.0.2.0/24", "192.0.4.0/24"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0", "192.0.2.0/24", "192.0.4.0/24"]

  }

}

resource "aws_security_group" "dbsg" {
  name        = "Rules for db"
  description = "Rules for ssh and http"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "PostgreSql"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.sg.id]
  }

}