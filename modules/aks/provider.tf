terraform {
  required_providers {
    azurerm = {
      version = "~> 2.62.0"
    }
    azuread = {
      source = "hashicorp/azuread"
      version = "~> 1.5.0"
    }
    azurecaf = {
      source = "aztfmod/azurecaf"
      version = "~> 1.2.4"
    }
  }
}