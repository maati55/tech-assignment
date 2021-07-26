variable "environment" {
  type        = string
  description = "Deployment environment. Used in resource naming convention"
}

variable "location" {
  type        = string
  description = "Deployment location. Azure region where the resources will be deployed. Used in resource naming convention"
}

variable "UID" {
  type        = string
  description = "Unique naming identifier. Used in resource naming convention"
}

variable "tags" {
  type        = map(string)
  description = "Key:value tags to apply to resources"
  default     = {}
}

variable "azure_region_code" {
  type        = map(any)
  description = "Map used to create a short identifier from Azure region code"
  default = {
    "uk south"     = "uks"
    "uk west"      = "ukw"
    "north europe" = "neu"
    "west europe"  = "weu"
  }
}

variable "data_subnet_id" {
  type        = string
  description = "Data subnet ID for AKS node pools"
  default     = ""
}

variable "network_plugin" {
  type        = string
  description = "AKS network plugin to be used. Options are kubenet & azure"
  default     = "kubenet"
}

variable "api_server_authorized_ip_ranges" {
  type        = list(string)
  description = "The IP ranges to whitelist for incoming traffic to the masters. Not relevant for private clusters"
  default     = []
}

variable "enable_private_cluster" {
  type        = bool
  description = "Should AKS cluster be private?"
  default     = true
}

variable "node_pools" {
  type        = any
  description = "List of nodes pool objects to create with properties to change from the defaults in local.default_node_properties"
  default     = []
}

variable "vm_size" {
  type        = string
  description = "AKS VM node size"
  default     = "Standard_D2_v3"
}
