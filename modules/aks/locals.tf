
locals {
  # AKS
  default_node_properties = {
    name                   = "default"
    vm_size                = var.vm_size
    os_type                = "Linux"
    availability_zones     = null
    enable_auto_scaling    = true
    node_count             = null
    min_count              = 1
    max_count              = 1
    type                   = "VirtualMachineScaleSets"
    node_taints            = null
    spot_max_price         = null
    eviction_policy        = null
    upgrade_max_surge      = 33
    max_pods               = 30
    node_labels            = null
    os_disk_size_gb        = 32
    enable_node_public_ip  = false
    enable_host_encryption = false
    os_disk_type           = "Managed"
  }

  default_node_pool = merge(local.default_node_properties, var.default_agent_pool)

  node_pools = [for group in var.node_pools : merge(local.default_node_properties, group)]
}
