terraform {
  backend "azurerm" {
    resource_group_name  = "tsm_remote_state_rg"
    storage_account_name = "tfstatetsmdevelopment"
    container_name       = "tfstate"
    key                  = "network.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.73.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "netrg" {
  name     = "${var.name}-net-rg"
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.name}-vnet"
  location            = var.location
  resource_group_name = azurerm_resource_group.netrg.name
  address_space       = [var.vnet-address-space]
}

resource "azurerm_subnet" "akssuba" {
  name                 = "${var.name}-aks-sub-a"
  resource_group_name = azurerm_resource_group.netrg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.aks-sub-a]
}

# resource "azurerm_subnet" "akssubc" {
#     name = "${var.name}-aks-sub-c"
#     location = "${var.location}-c"
#     virtual_network_name = azurerm_virtual_network.vnet.name
#     address_prefixes = [var.aks-sub-c]
# }

resource "azurerm_subnet" "dbb" {
  name                 = "${var.name}-db-sub-b"
  resource_group_name = azurerm_resource_group.netrg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.db-sub-b]
}

resource "azurerm_subnet" "dbc" {
  name                 = "${var.name}-db-sub-c"
  resource_group_name = azurerm_resource_group.netrg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.db-sub-c]
}

resource "azurerm_subnet" "appgwsub" {
  name                 = "${var.name}-appgw-sub"
  resource_group_name = azurerm_resource_group.netrg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.agw-sub-a]
}