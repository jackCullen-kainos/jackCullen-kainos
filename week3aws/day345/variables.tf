variable "region" {
  description = "aws region"
  default     = "eu-west-1"
}

variable "instance-count" {
  description = "Number of instances deployed in a cluster"
  default     = 2
}

variable "size" {
  description = "Size of instances"
  default     = "t2.micro"
}