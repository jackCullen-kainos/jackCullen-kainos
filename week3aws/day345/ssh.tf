resource "aws_key_pair" "ssh_key" {
  key_name   = "ssh_key_jc3"
  public_key = file("~/.ssh/new-key-jc.pub")
}