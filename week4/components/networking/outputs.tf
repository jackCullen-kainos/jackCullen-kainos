output "vpc-id" {
    value = module.networking.vpc-id
}

output "pub-sub-ids" {
    value = module.networking.pub-sub-ids  
}

output "pub-sub-cidr_blocks" {
    value = module.networking.priv-sub-cidr_blocks  
}

output "priv-sub-ids" {
    value = module.networking.priv-sub-ids
}

output "priv-sub-cidr_blocks" {
    value = module.networking.priv-sub-cidr_blocks
}