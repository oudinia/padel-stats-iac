# ./main.tf
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "acr" {
  source              = "./modules/acr"
  resource_group_name = var.resource_group_name
  location            = var.location
  acr_name            = var.acr_name
}

module "aci" {
  source              = "./modules/aci"
  aci_name            = var.aci_name
  location            = var.location
  resource_group_name = var.resource_group_name
  container_image     = var.container_image
}