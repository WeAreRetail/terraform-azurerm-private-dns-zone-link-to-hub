terraform {

  required_version = ">= 1.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.2"

    }
  }
}

locals {
  Sub_CedricG = "6ff7089b-cdc2-4513-bfd9-39d707ea3748"
  Sub_SecOps  = "dafd3277-529c-414e-aa3b-66ebc5775217"
}

provider "azurerm" {
  subscription_id = local.Sub_CedricG
  # Configuration options
  features {}
  storage_use_azuread        = true
  skip_provider_registration = false
}

provider "azurerm" {
  alias           = "hub"
  subscription_id = local.Sub_SecOps
  # Configuration options
  features {}
  storage_use_azuread        = true
  skip_provider_registration = false
}
