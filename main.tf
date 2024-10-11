terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~> 3.0"
    }
  }
}

provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "lesmoulineaux" {
  name = "les-moulineaux"
  location = "West Europe"
}

resource "azurerm_service_plan" "lesmoulineaux" {
  name                = "les-moulineaux-plan"
  resource_group_name = azurerm_resource_group.lesmoulineaux.name
  location            = azurerm_resource_group.lesmoulineaux.location
  os_type             = "Linux"
  sku_name            = "S1"
}

resource "azurerm_linux_web_app" "lesmoulineauxapi" {
  name                = "les-moulineaux-linux-web-app"
  location            = azurerm_resource_group.lesmoulineaux.location
  resource_group_name = azurerm_resource_group.lesmoulineaux.name
  service_plan_id     = azurerm_service_plan.lesmoulineaux.id

  site_config {
    application_stack {
     dotnet_version = "8.0" 
    }
  }
}