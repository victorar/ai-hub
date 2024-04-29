provider "azurerm" {
  environment     = "public"
    features {
      key_vault {
          purge_soft_delete_on_destroy               = true
          purge_soft_deleted_certificates_on_destroy = true
          purge_soft_deleted_keys_on_destroy         = true
          purge_soft_deleted_secrets_on_destroy      = true
          recover_soft_deleted_key_vaults            = true
          recover_soft_deleted_certificates          = true
          recover_soft_deleted_keys                  = true
          recover_soft_deleted_secrets               = true
        }
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

data "azurerm_subscription" "current" {
}

terraform {
  required_version = ">=0.14"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.100.0"
    }
    azapi = {
      source  = "azure/azapi"
      version = "1.13.0"
    }
  }
}

resource "azurerm_resource_group" "ingestion" {
  name     = local.ingestion_rg
  location = local.location
}

# resource "azurerm_resource_group" "observability" {
#   name     = local.observability_rg
#   location = local.location
# }

# resource "azurerm_resource_group" "processing" {
#   name     = local.processing_rg
#   location = local.location
# }

