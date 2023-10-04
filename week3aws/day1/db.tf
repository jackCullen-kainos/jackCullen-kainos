resource "aws_db_instance" "db" {
  allocated_storage    = 20
  engine               = "MySQL"
  engine_version       = "8.0"
  storage_type         = "gp2"
  instance_class       = "db.t3.micro"
  username             = "guest"
  password             = "guest123"
  db_subnet_group_name = aws_db_subnet_group.db-subnet-g.name
  identifier           = "db-jc"
  db_name              = "mydb"
  multi_az             = true

  vpc_security_group_ids = [aws_security_group.sg_db_jc.id]

}

