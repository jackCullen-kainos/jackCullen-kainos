variable "region" {
    type = string
    description = "region"
}

variable "account-id" {
    type =  string 
}

variable "public-subnets" {
    type = list(string)  
}

variable "priv-subnet" {
    type = list(string)  
}

variable "project" {
  type        = string
  description = "Name of the project"
  default     = "kpa-jack-2023"
}

variable "environment" {
  type        = string
  description = "The name of the env of the bootstrapping process"
  default     = "state"
}

variable "vpc_cidr_block" {
    type = string
}

variable "ngw-count" {
    type = number
}