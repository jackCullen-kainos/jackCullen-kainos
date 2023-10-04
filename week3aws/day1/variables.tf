variable "trusted_ips" {
  type        = list(string)
  description = "List of trusted Kainos trusted IPS"
}


variable "region" {
  description = "AWS Region"
  default     = "eu-west-1"
}