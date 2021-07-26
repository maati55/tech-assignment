
output "aks_id" {
  value       = azurerm_kubernetes_cluster.aks.id
  description = "The Kubernetes Managed Cluster ID"
}

output "aks_fqdn" {
  value       = azurerm_kubernetes_cluster.aks.fqdn
  description = "The FQDN of the Azure Kubernetes Managed Cluster"
}

output "aks_private_fqdn" {
  value       = azurerm_kubernetes_cluster.aks.private_fqdn
  description = "The FQDN for the Kubernetes Cluster when private link has been enabled, which is only resolvable inside the Virtual Network used by the Kubernetes Cluster"
}

output "kube_config" {
  value       = azurerm_kubernetes_cluster.aks.kube_config
  description = "Kube config as used by kubectl"
  sensitive   = true
}

output "aks_name" {
  value       = azurerm_kubernetes_cluster.aks.name
  description = "The Aks cluster Name"
}

output "aks_rg" {
  value       = azurerm_kubernetes_cluster.aks.resource_group_name
  description = "The Aks cluster Resource Group Name"
}
