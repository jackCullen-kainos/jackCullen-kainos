variable "public-subnets" {
  type        = list(string)
  description = "List of the public subnets"
}

variable "ngw-count" {
  type        = number
  description = "Number of NAT Gateways"
}

variable "priv-subnet" {
  type        = list(string)
  description = "List of all the private subnets"
}

variable "project" {
  type        = string
  description = "Name of the project"
  default     = "kpa-jack-2023"
}

variable "env" {
  type        = string
  description = "The name of the env of the bootstrapping process"
  default     = "state"
}

variable "vpc-cidr-block" {
  type        = string
  description = "The vpc-cidr-block"
}

variable "region" {
    type = string
    description = "deployment region for this region"  
}