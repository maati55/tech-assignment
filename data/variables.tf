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

data "terraform_remote_state" "azure_aks" {
  backend = "azurerm"

  config = {
    key                  = "devenv:azure_aks_uks"
    container_name       = "tech-sa-con"
    storage_account_name = "techsta"
    resource_group_name  = "tech-sc-rg"
  }
}

variable "aad_pod_chart_version" {
  type        = string
  description = "The Helm chart version to install"
}

variable "aad_pod_release_namespace" {
  type        = string
  description = "The namespace to install the Helm release into"
}

variable "datadog_chart_version" {
  type        = string
}

variable "datadog_release_namespace" {
  type        = string
}

variable "datadog_site" {
  type        = string
}

variable "datadog_apiKey" {
  type        = string
}
