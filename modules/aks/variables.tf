variable "name" {
  type        = string
  description = "The name of the Managed Kubernetes Cluster to create"
}

variable "resource_group" {
  type        = string
  description = "Specifies the Resource Group where the Managed Kubernetes Cluster should exist"
}

variable "node_resource_group" {
  type        = string
  description = "The name of the Resource Group where the Kubernetes Nodes should exist"
}

variable "location" {
  type        = string
  description = "The location where the Managed Kubernetes Cluster should be created"
}

variable "default_agent_pool" {
  type        = any
  description = "Properties of the default node pool to change from the defaults in local.default_node_properties"
  default     = []
}

variable "kubernetes_version" {
  type        = string
  description = "Version of Kubernetes specified when creating the AKS managed cluster"
  default     = "1.19.11"
}

variable "node_pools" {
  type        = any
  description = "List of nodes pool objects to create with properties to change from the defaults in local.default_node_properties"
  default     = []
}

variable "sku_tier" {
  type        = string
  description = "The SKU Tier that should be used for this Kubernetes Cluster. Possible values are Free and Paid"
  default     = "Free"
}

variable "enable_private_cluster" {
  type        = bool
  description = "Should this Kubernetes Cluster have its API server only exposed on internal IP addresses? This provides a Private IP Address for the Kubernetes API on the Virtual Network where the Kubernetes Cluster is located"
  default     = false
}

variable "api_server_authorized_ip_ranges" {
  type        = list(string)
  description = "The IP ranges to whitelist for incoming traffic to the masters. Not relevant for private clusters"
  default     = []
}

variable "automatic_channel_upgrade" {
  type        = string
  description = "The upgrade channel for this Kubernetes Cluster. NOT CURRENTLY USED"
  default     = "stable"
}

variable "cluster_identity_type" {
  type        = string
  description = "Identity type to use for this cluster. SystemAssigned recommended for Managed Identity clusters"
  default     = "SystemAssigned"
}

variable "cluster_identity_assigned_identity_id" {
  type        = string
  description = "The ID of a user assigned identity. Not used when cluster_identity_type = SystemAssigned"
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource"
  default     = {}
}

variable "network_plugin" {
  type        = string
  description = "Network plugin to use for networking. Currently supported values are azure and kubenet"
  default     = "kubenet"
}

variable "service_cidr" {
  type        = string
  description = "The Network Range used by the Kubernetes service"
  default     = "10.170.0.0/16"
}

variable "docker_bridge_cidr" {
  type        = string
  description = "IP address (in CIDR notation) used as the Docker bridge IP address on nodes"
  default     = "170.10.0.1/16"
}

variable "dns_service_ip" {
  type        = string
  description = "IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns)"
  default     = "10.170.0.10"
}

variable "network_policy" {
  type        = string
  description = "Sets up network policy to be used with Azure CNI"
  default     = "calico"
}


variable "vm_size" {
  type        = string
  description = "AKS VM node size"
  default     = "Standard_D2_V2"
}

variable "nametags" {
  type    = list(string)
  description = "Name tags used in naming convention"
  default = []
}
