 variable "client_secret" {
}

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
  client_id       = "29348289-19bc-46dc-a8f8-7da7dbc6f77c"
  client_secret   = var.client_secret
  tenant_id       = "14595b8b-b1ba-4274-8a30-b513dff9d2a7"
}