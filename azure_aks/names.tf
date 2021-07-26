################################################################
# Resource groups
################################################################
resource "azurecaf_name" "rg_aks" {
  name          = "aks"
  resource_type = "azurerm_resource_group"
  suffixes      = local.nametags
}

resource "azurecaf_name" "rg_aksnodes" {
  name          = "aksnodes"
  resource_type = "azurerm_resource_group"
  suffixes      = local.nametags
}

################################################################
# AKS
################################################################
resource "azurecaf_name" "aks" {
  resource_type = "azurerm_kubernetes_cluster"
  suffixes      = local.nametags
}
