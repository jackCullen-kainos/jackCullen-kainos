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




resource "aws_instance" "instance" {
  tags = {
    Name = "inst-jc"
    tag  = "inst-jc"
  }
  ami           = data.aws_ami.ami.id
  instance_type = "t2.micro"

  subnet_id       = aws_subnet.subnetinst.id
  security_groups = [aws_security_group.sg_jc.id]

  key_name = aws_key_pair.ssh_key.key_name
}