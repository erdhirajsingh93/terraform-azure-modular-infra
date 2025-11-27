terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.49.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "backend-rg"
    storage_account_name = "pcslbackendforstg2025"
    container_name       = "dhirajbackend"
    key                  = "dev.tfstate"

  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}