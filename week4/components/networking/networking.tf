module "networking" {
    source = "../../modules/networking"

    region = var.region
    project = var.project
    env = var.environment
    vpc-cidr-block = var.vpc_cidr_block
    public-subnets = var.public-subnets
    priv-subnet = var.priv-subnet 
    ngw-count = var.ngw-count
    
}