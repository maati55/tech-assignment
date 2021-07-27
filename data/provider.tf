data "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = data.terraform_remote_state.azure_aks.outputs.aks_name #module.aks.aks_name
  resource_group_name = data.terraform_remote_state.azure_aks.outputs.aks_rg #module.aks.aks_rg
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = false
    }
  }
}

terraform {
  required_version = ">= 0.14.5"
  # experiments = [
  #   module_variable_optional_attrs
  # ]
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

provider "helm" {
  # experiments {
  #   manifest = true
  # }
  kubernetes {
    host                   = data.azurerm_kubernetes_cluster.aks_cluster.kube_config.0.host
    username               = data.azurerm_kubernetes_cluster.aks_cluster.kube_config.0.username
    password               = data.azurerm_kubernetes_cluster.aks_cluster.kube_config.0.password
    client_certificate     = base64decode(data.azurerm_kubernetes_cluster.aks_cluster.kube_config.0.client_certificate)
    client_key             = base64decode(data.azurerm_kubernetes_cluster.aks_cluster.kube_config.0.client_key)
    cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.aks_cluster.kube_config.0.cluster_ca_certificate)
  }
}
