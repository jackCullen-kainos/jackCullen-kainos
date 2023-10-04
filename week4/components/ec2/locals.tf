locals{
    naming-convention = "${var.project}-${var.environment}"

    public-subnet-cidrs = data.terraform_remote_state.networking.outputs.pub-sub-cidr_blocks

    ec2-web-ingress-rules = [
        {
            description = "ssh_inbound_public_subnets"
            protocol = "tcp"
            to_port = 22
            from_port = 22
            cidr_blocks = "${local.public-subnet-cidrs}"
        },
        {
            description = "http_inbound_pub_sub"
            protocol = "tcp"
            to_port = 80
            from_port = 80
            cidr_blocks = "${local.public-subnet-cidrs}"
        }        
    ]

    ec2-web-egress-rules = [
        {
            description = "default"
            protocol = "tcp"
            to_port = 0
            from_port = 0
            cidr_blocks = ["0.0.0.0/0"]
        }
    ]

    ec2-mgmt-ingress-rules = [
        {
            description = "ssh_inbound_pub_sub"
            protocol = "tcp"
            to_port = 22
            from_port = 22
            cidr_blocks = "${var.trusted-ips}"
        }
    ]

    ec2-mgmt-egress-rules = [
        {
            description = "default"
            protocol = "tcp"
            to_port = 0
            from_port = 0
            cidr_blocks = ["0.0.0.0/0"]
        }
    ]
}