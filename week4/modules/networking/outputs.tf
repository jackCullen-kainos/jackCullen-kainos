output "vpc-id" {
    value = aws_vpc.vpc.id
}

output "pub-sub-ids" {
    value = aws_subnet.pubsub.*.id  
}

output "pub-sub-cidr_blocks" {
    value = aws_subnet.pubsub.*.cidr_block  
}

output "priv-sub-ids" {
    value = aws_subnet.privsub.*.id  
}

output "priv-sub-cidr_blocks" {
    value = aws_subnet.privsub.*.cidr_block
}