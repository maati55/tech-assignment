data "azurerm_resource_group" "aks" {
  name = var.resource_group
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                            = var.name
  resource_group_name             = var.resource_group
  location                        = var.location
  sku_tier                        = var.sku_tier
  private_cluster_enabled         = var.enable_private_cluster
  api_server_authorized_ip_ranges = var.enable_private_cluster ? null : var.api_server_authorized_ip_ranges
  kubernetes_version              = var.kubernetes_version
  node_resource_group             = var.node_resource_group
  dns_prefix                      = var.name
  enable_pod_security_policy      = false

  identity {
    type                      = var.cluster_identity_type
    user_assigned_identity_id = var.cluster_identity_assigned_identity_id
  }

  network_profile {
    network_plugin     = var.network_plugin
    network_policy     = var.network_policy
    service_cidr       = var.service_cidr
    docker_bridge_cidr = var.docker_bridge_cidr
    dns_service_ip     = var.dns_service_ip
  }

  role_based_access_control {
    enabled = false
  }

  addon_profile {
    kube_dashboard {
      enabled = false
    }
    azure_policy {
      enabled = true
    }
    http_application_routing {
      enabled = false
    }
  }

  default_node_pool {
    name                   = local.default_node_pool.name
    node_count             = local.default_node_pool.node_count
    vm_size                = local.default_node_pool.vm_size
    availability_zones     = local.default_node_pool.availability_zones
    enable_auto_scaling    = local.default_node_pool.enable_auto_scaling
    min_count              = local.default_node_pool.min_count
    max_count              = local.default_node_pool.max_count
    max_pods               = local.default_node_pool.max_pods
    os_disk_size_gb        = local.default_node_pool.os_disk_size_gb
    type                   = local.default_node_pool.type
    enable_host_encryption = local.default_node_pool.enable_host_encryption
    upgrade_settings {
      max_surge = local.default_node_pool.upgrade_max_surge
    }
  }

  tags = var.tags
}

# resource "azurerm_kubernetes_cluster_node_pool" "this" {
#   for_each               = { for pool in local.node_pools : pool.name => pool }
#   name                   = each.key
#   enable_auto_scaling    = lookup(each.value, "enable_auto_scaling")
#   os_disk_size_gb        = lookup(each.value, "os_disk_size_gb")
#   max_count              = lookup(each.value, "max_count")
#   min_count              = lookup(each.value, "min_count")
#   node_labels            = lookup(each.value, "node_labels")
#   vm_size                = lookup(each.value, "vm_size")
#   node_count             = lookup(each.value, "node_count")
#   node_taints            = lookup(each.value, "node_taints")
#   spot_max_price         = lookup(each.value, "spot_max_price")
#   eviction_policy        = lookup(each.value, "eviction_policy")
#   availability_zones     = lookup(each.value, "availability_zones")
#   max_pods               = lookup(each.value, "max_pods")
#   os_type                = lookup(each.value, "os_type")
#   os_disk_type           = lookup(each.value, "os_disk_type")
#   enable_node_public_ip  = lookup(each.value, "enable_node_public_ip")
#   enable_host_encryption = lookup(each.value, "enable_host_encryption")
#   kubernetes_cluster_id  = azurerm_kubernetes_cluster.aks.id
#   upgrade_settings {
#     max_surge = lookup(each.value, "upgrade_max_surge")
#   }
# }
