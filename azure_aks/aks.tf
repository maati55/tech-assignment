################################################################################################################
# AKS
################################################################################################################
resource "azurerm_resource_group" "aks" {
  name     = azurecaf_name.rg_aks.result
  tags     = local.tags
  location = var.location
}

module "aks" {
  source                          = "../modules/aks"
  name                            = azurecaf_name.aks.result
  resource_group                  = azurerm_resource_group.aks.name
  node_resource_group             = azurecaf_name.rg_aksnodes.result
  location                        = var.location
  network_plugin                  = var.network_plugin
  api_server_authorized_ip_ranges = var.api_server_authorized_ip_ranges
  enable_private_cluster          = var.enable_private_cluster
  vm_size                         = var.vm_size

  default_agent_pool = {
    max_count      = 1
  }

  node_pools = var.node_pools
  nametags  = local.nametags
  tags      = local.tags
}
