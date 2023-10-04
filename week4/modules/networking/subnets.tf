resource "aws_subnet" "pubsub" {
  count      = length(var.public-subnets)
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public-subnets[count.index]

  availability_zone = data.aws_availability_zones.available.names[count.index % local.az-count]


  tags = merge(local.default_tags, tomap({
    "Name"              = "${local.naming-convention}-public-subnet"
    "Vpc"               = "${local.naming-convention}-vpc"
    //"Availability Zone" = "${data_aws_availability_zones.available.names[count.index % local.az-count]}"
  }))
}

resource "aws_subnet" "privsub" {
  count      = length(var.priv-subnet)
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.priv-subnet[count.index]

  availability_zone = data.aws_availability_zones.available.names[count.index % local.az-count]

  tags = merge(local.default_tags, tomap({
    "Name"              = "${local.naming-convention}-private-subnet"
    "Vpc"               = "${local.naming-convention}-vpc"
    //"Availability Zone" = "${data_aws_availability_zones.available.names[count.index % local.az-count]}"
  }))
}