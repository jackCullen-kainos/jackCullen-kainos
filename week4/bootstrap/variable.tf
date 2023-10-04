variable "aws-region" {
  type        = string
  description = "This is our region in aws"
  default     = "eu-west-1"
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

variable "accountid" {
  type = string
  description = "Account ID"
  default = "138588690193"
}