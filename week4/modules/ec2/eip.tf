resource "aws_eip" "ec2eip" {
    count = var.pub-ip-enabled ? var.no-of-inst : 0

    vpc = true
}

resource "aws_eip_association" "ec2eip-assoc" {
    count = var.pub-ip-enabled ? var.no-of-inst : 0

    instance_id = aws_instance.ec2[count.index].id
    allocation_id = aws_eip.ec2eip[count.index].id
}