terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.67.0"
    }
  }
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