module "web-ec2" {

    source = "../../modules/ec2"
    
    region = var.region
    project = var.project
    env = var.environment
    role = "web-ec2"

    vpc-id = data.terraform_remote_state.networking.outputs.vpc-id
    priv-subnet-id = data.terraform_remote_state.networking.outputs.priv-sub-ids
    no-of-inst = var.no-of-web-inst
    instance-ami = data.aws_ami.aws-linux.id
    user-data-file = file("${path.module}/ami-user-data/web-init.sh")
    keypair = aws_key_pair.sshkey.key_name
    pub-ip-enabled = true
    ec2-ingress-rules = local.ec2-web-ingress-rules
    ec2-egress-rules = local.ec2-web-egress-rules
}