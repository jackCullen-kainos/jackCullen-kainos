variable "name" {
  type    = string
  default = "tsm"
}

variable "env" {
  type    = string
  default = "dev"
}

variable "location" {
  type    = string
  default = "uksouth"
}

variable "vnet-address-space" {
  type    = string
  default = "192.168.0.0/16"
}

variable "aks-sub-a" {
  type    = string
  default = "192.168.1.0/24"
}

variable "aks-sub-c" {
  type    = string
  default = "192.168.2.0/24"
}

variable "db-sub-b" {
  type    = string
  default = "192.168.3.0/24"
}

variable "db-sub-c" {
  type    = string
  default = "192.168.4.0/24"
}

variable "agw-sub-a" {
  type    = string
  default = "192.168.5.0/24"
}