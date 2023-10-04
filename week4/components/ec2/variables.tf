variable "region" {
    type = string  
}

variable "account-id" {
    type = string  
}

variable "project" {
    type = string  
}

variable "environment" {
    type = string  
}

variable "public-subnets" {
    type = list(string)  
}

variable "no-of-web-inst" {
    type = number
    default = 1  
}

variable "web-inst-size" {
    type = string
    default = "t2.micro"  
}

variable "no-of-mgmt-inst" {
    type = number
    default = 1  
}

variable "mgmt-inst-size" {
    type = string
    default = "t2.micro"  
}

variable "s3-state-bucket" {
    type = string
}

variable "trusted-ips" {
    type = list(string)  
}