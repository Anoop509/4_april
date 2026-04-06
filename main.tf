terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.67.0"
    }
  }
  backend "azurerm" {} 
}

provider "azurerm" {
  # Configuration options
  subscription_id = "7004d8e7-029e-4e9a-aa85-a5a6f377e11b"
  features {}
}

resource "azurerm_resource_group" "anooprg" {
  name     = "anooprg"
  location = "West Europe"
}
resource "azurerm_storage_account" "anoop_sa" {
  name                     = "anoopsa"
  resource_group_name      = azurerm_resource_group.anooprg.name
  location                 = azurerm_resource_group.anooprg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  
}

resource "azurerm_virtual_network" "anooopvnet" {
  name                = "anoopvnet"
  address_space       = ["10.0.0.0/16"]
    location             = azurerm_resource_group.anooprg.location
    resource_group_name  = azurerm_resource_group.anooprg.name
  
}
resource "azurerm_subnet" "anoopsubnet" {
  name                 = "anoopsubnet"
  resource_group_name  = azurerm_resource_group.anooprg.name
  virtual_network_name = azurerm_virtual_network.anooopvnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_resource_group" "anoop_5april" {
  name     = "anoop_5april"
  location = "West Europe"
  
}