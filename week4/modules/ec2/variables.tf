variable "project" {
    type = string
    description = "Project name"  
}//

variable "env" {
    type = string
    description = "the type of env"  
}//

variable "region" {
    type = string
    description = "The region the instance is in"  
}//

variable "no-of-inst" {
    type = number
    description = "How many instances are running"  
}

variable "instance-ami" {
    type = string
    description = "The image of instance"  
}

variable "role" {
    type = string
    description = "Role of machine"  
}

variable "inst-size" {
    type = string
    description = "the size of vm"
    default = "t2.micro"  
}

variable "vpc-id" {
    type = string  
}

variable "priv-subnet-id" {
    type = list(string)  
}

variable "pub-ip-enabled" {
    type = bool
    description = "Set to false by default as only management ips should be public"
    default = false  
}

variable "user-data-file" {
    type = string 
    description = "script that is ran on lunch"  
}

variable "keypair" {
    type = string
    default = ""
}

variable "sg-ingress-port" {
    type = number
    description = "The ingress port"
    default = 80  
}

variable "ec2-ingress-rules" {
    type = list(object({
        description = string
        from_port = number
        to_port = number
        protocol = string
        cidr_blocks = list(string)
    })) 

    default = [] 
}

variable "ec2-egress-rules" {
    type = list(object({
      description = string
      from_port = number
      to_port = number
      protocol = string
      cidr_blocks = list(string)
    }))
  
  default = []
}