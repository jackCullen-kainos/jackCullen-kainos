resource "aws_key_pair" "ssh_key" {
  key_name   = "ssh_key_jc2"
  public_key = file("~/.ssh/new-key-jc.pub")
}

/*resource "tls_private_key" "privkey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "ssh_private_key" {
  content  = tls_private_key.privkey.private_key_pem
  filename = "simple-web-jc"
}*/