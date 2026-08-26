terraform {

  required_version = ">= 1.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=5.0.0"

    }
  }
}

locals {
  Sub_SecOps  = "dafd3277-529c-414e-aa3b-66ebc5775217"
}

provider "azurerm" {
  alias           = "hub"
  subscription_id = local.Sub_SecOps
  # Configuration options
  features {}
  storage_use_azuread             = true
  resource_provider_registrations = "core"
}
