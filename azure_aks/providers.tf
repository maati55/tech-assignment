provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = false
    }
  }
}

terraform {
  required_version = ">= 0.14.5"
  experiments = [
    module_variable_optional_attrs
  ]
  backend "azurerm" {
    key = "dev"
  }

  required_providers {
    azurerm = {
      version = "~> 2.62.0"
    }
    azurecaf = {
      source  = "aztfmod/azurecaf"
      version = "~> 1.2.0"
    }
  }
}
