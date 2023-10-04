locals {
  naming-convention = "${var.project}-${var.env}"

  default_tags = {
    Project   = var.project
    Component = "Networking"
    Env       = var.env
  }

  subnet-az-map = {
    for idx, az in data.aws_availability_zones.available.names : az => {
      route_table_id = element(aws_route_table.priv-route-table, idx).id
      subnet_count = length([for s in aws_subnet.privsub : s if s.availability_zone == az])
    }
  }

  az-count = length(data.aws_availability_zones.available.names)
}