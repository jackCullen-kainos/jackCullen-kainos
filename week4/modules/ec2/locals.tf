locals {
  naming-convention = "${var.project}-${var.env}-${var.role}"

  default_tags = {
    Project = var.project
    Component = "EC2"
    Environment = var.env
  }
}