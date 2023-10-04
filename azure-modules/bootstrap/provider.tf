terraform {
  required_providers {
    azurerm = {
        source = "hasicorp/azurerm"
        version = "~> 3.67.0"
    }
  }
}

provider "azurerm" {
  features {

  }  
}

resource "azurerm_resource_group" "name" {
  name = "${var.naming-con}rg"
  location = var.location
} 