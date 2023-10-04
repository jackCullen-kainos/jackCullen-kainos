resource "aws_security_group" "webserver-sg" {

    name = "allow_internet_traffic"
    description = "Rules for http and ssh"
    vpc_id = aws_vpc.webserver_vpc.id

    ingress {
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = var.trusted_ips
    }

    ingress {
        description = "http from vpc"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = var.trusted_ips
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }
  

  
}