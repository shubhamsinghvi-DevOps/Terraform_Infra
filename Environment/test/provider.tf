terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.49.0"
    }
  }
    backend "azurerm" {
      resource_group_name = "RG_Practice1"
      storage_account_name = "shubhamsinghvi40342411"
      container_name = "finaltest"
      key = "test.tfstate"
    }
}

provider "azurerm" {
  features {}
  subscription_id = "6b38de24-6577-4220-8a9e-3ddcaa335ffc"
}