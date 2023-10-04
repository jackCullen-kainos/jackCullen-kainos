resource "aws_key_pair" "ssh_key" {
    key_name = "ssh_key_jc"
    public_key = file("~/.ssh/simple-web-jc.pub")
}

resource "tls_private_key" "keygen" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "local_file" "ssh_private_key" {
    content = tls_private_key.keygen.private_key_pem
    filename = "simple-web-jc"
}