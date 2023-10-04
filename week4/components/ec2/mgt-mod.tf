module "mgmt-ec2" {

    source = "../../modules/ec2"
    
    region = var.region
    project = var.project
    env = var.environment
    role = "ec2-mgmt"

    vpc-id = data.terraform_remote_state.networking.outputs.vpc-id
    priv-subnet-id = data.terraform_remote_state.networking.outputs.pub-sub-ids
    no-of-inst = var.no-of-mgmt-inst
    instance-ami = data.aws_ami.ubuntu.id
    user-data-file = file("${path.module}/ami-user-data/mgmt-init.sh")
    keypair = aws_key_pair.sshkey.key_name
    pub-ip-enabled = true
    ec2-ingress-rules = local.ec2-mgmt-ingress-rules
    ec2-egress-rules = local.ec2-mgmt-egress-rules
}