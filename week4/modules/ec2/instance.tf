resource "aws_instance" "ec2" {
    count = var.no-of-inst
    ami = var.instance-ami

    subnet_id = var.priv-subnet-id[count.index % length(var.priv-subnet-id)]

    user_data = var.user-data-file

    instance_type = var.inst-size

    tags = {
      Name = "${local.naming-convention}-ec2-${count.index}"
      Role = var.role
    }

    lifecycle {
      create_before_destroy = true
    }

}