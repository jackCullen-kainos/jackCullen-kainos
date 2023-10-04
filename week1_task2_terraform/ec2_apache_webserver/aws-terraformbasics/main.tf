resource "aws_instance" "webserver" {
    ami = data.aws_ami.ubuntu.id
    instance_type = var.instance_type

    subnet_id = aws_subnet.webserver_subnet.id
    security_groups = [aws_security_group.webserver-sg.id]

    user_data = <<-EOF
    #!/bin/bash
    echo "*** Installing apache2"
    sudo apt update -y
    sudo apt install apache2 -y
    echo "*** Completed Installing apache2"
    EOF


    key_name = aws_key_pair.ssh_key.key_name

    tags = {
        Name = "JC Webserver"
    }


  
}

data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
      name = "name"
      values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }

      filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
