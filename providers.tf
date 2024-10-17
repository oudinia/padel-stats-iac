terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"  # Specify the version you want to use
    }
  }
}

provider "azurerm" {
  features {}
  # If you're using Azure CLI authentication, you don't need to specify credentials here
  # For other authentication methods, you would add the necessary credentials here
}