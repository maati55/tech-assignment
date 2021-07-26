locals {
  nametag_location = lookup(var.azure_region_code, lower(var.location))
  nametags         = [var.environment, local.nametag_location, var.UID]
  tags = merge({
    workspace   = terraform.workspace
    environment = var.environment
  }, var.tags)
}
