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



resource "aws_instance" "inst1" {
  tags = {
    Name = "inst1-jc"
  }
  ami           = data.aws_ami.ami.id
  instance_type = "t2.micro"

  user_data = <<-EOF
  #!/bin/bash
  echo "*** Installing apache2"
  sudo apt update -y
  sudo apt install apache2 -y
  echo "*** Completed Installing apache2"
  systemctl enable apache2
  EOF

  subnet_id       = aws_subnet.serversubnet1.id
  security_groups = [aws_security_group.sg.id]

  key_name = aws_key_pair.ssh_key.key_name
}

resource "aws_instance" "inst2" {
  tags = {
    Name = "inst2-jc"
  }
  ami           = data.aws_ami.ami.id
  instance_type = "t2.micro"

  user_data = <<-EOF
  #!/bin/bash
  echo "*** Installing apache2"
  sudo apt update -y
  sudo apt install apache2 -y
  echo "*** Completed Installing apache2"
  systemctl enable apache2
  EOF

  subnet_id       = aws_subnet.serversubnet2.id
  security_groups = [aws_security_group.sg.id]

  key_name = aws_key_pair.ssh_key.key_name

}