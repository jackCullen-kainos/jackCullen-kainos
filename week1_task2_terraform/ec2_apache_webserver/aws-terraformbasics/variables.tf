variable "region" {
  description = "AWS Region"
  default     = "eu-west-1"
}

variable "vpc_cidr" {
  description = "CIDR For vpc"
  default     = "10.0.0.0/16"
}

variable "webserver_subnet_cidr" {
  description = "CIDR For vpc"
  default     = "10.0.0.0/24"
}

variable "trusted_ips" {
    type = list(string)
    description = "List of trusted Kainos trusted IPS"
  
}

variable "instance_type" {
    description = "EC2 instance Type"
    default = "t2.micro"
  
}