data "aws_ami" "ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "cluster-zone-a" {
  count         = var.instance-count
  ami           = data.aws_ami.ami.id
  instance_type = var.size

  subnet_id       = aws_subnet.priv-sub-a.id
  security_groups = [aws_security_group.conn.id]

  key_name = aws_key_pair.ssh_key.key_name

  user_data = <<-EOF
  #!/bin/bash
  echo "*** Installing apache2"
  sudo apt update -y
  sudo apt install apache2 -y
  echo "*** Completed Installing apache2"
  echo "<h1>loading from $(hostname -f)..</h1>" > /var/www/html/index.html
  EOF



  tags = {
    Name = "cluster-a-inst-${count.index}"
  }

}

resource "aws_instance" "cluster-zone-b" {
  count         = var.instance-count
  ami           = data.aws_ami.ami.id
  instance_type = var.size

  subnet_id       = aws_subnet.priv-sub-b.id
  security_groups = [aws_security_group.conn.id]

  key_name = aws_key_pair.ssh_key.key_name

  user_data = <<-EOF
  #!/bin/bash
  echo "*** Installing apache2"
  sudo apt update -y
  sudo apt install apache2 -y
  echo "*** Completed Installing apache2"
  echo "<h1>loading from $(hostname -f)..</h1>" > /var/www/html/index.html
  EOF



  tags = {
    Name = "cluster-b-inst-${count.index}"
  }

}