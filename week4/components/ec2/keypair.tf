resource "tls_private_key" "priv-key" {
    algorithm = "RSA"
    rsa_bits = 4096 
}

resource "aws_key_pair" "sshkey" {
    key_name = "${local.naming-convention}-ec2-key"
    public_key = tls_private_key.priv-key.public_key_openssh  
}

resource "local_file" "ssh-priv-key" {
    content = tls_private_key.priv-key.private_key_pem
    filename = pathexpand("~/.ssh/${local.naming-convention}-ec2-key.pem")
    file_permission = "0400"
}