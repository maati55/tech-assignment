output "aks_name" {
  value       = module.aks.aks_name
  description = "AKS name"
}

output "aks_rg" {
  value       = module.aks.aks_rg
  description = "AKS Resource Group"
}
