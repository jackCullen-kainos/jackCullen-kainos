resource "aws_db_instance" "db" {
  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "12"
  storage_type         = "gp2"
  instance_class       = "db.t3.micro"
  username             = "guest"
  password             = "guest12345"
  db_subnet_group_name = aws_db_subnet_group.db-subnet-group.name
  identifier           = "db-jc"
  db_name              = "mydb"
  multi_az             = false

  vpc_security_group_ids = [aws_security_group.dbsg.id]

  skip_final_snapshot = true
}