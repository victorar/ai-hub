variable "location" {
  description = "Specifies the location for all Azure resources."
  type        = string
  sensitive   = false
  default     = "eastus"
}

variable "azureOpenAiWorkload_rg" {
  description = "Specifies the name of the resource group."
  type        = string
  sensitive   = false
  default     = "esp1-azoai-eastus-rg"
  validation {
    condition     = length(var.azureOpenAiWorkload_rg) >= 2
    error_message = "Please specify a valid name."
  }
}

variable "observability_rg" {
  description = "Specifies the name of the resource group."
  type        = string
  sensitive   = false
  default     = "esp1-logw-eastus-rg"
  validation {
    condition     = length(var.observability_rg) >= 2
    error_message = "Please specify a valid name."
  }
}

variable "subnet_id" { 
  description = "Specifies the resourceId of an existing subnet, in the same region as the rest of the workloads that will be created."
  type        = string
  sensitive   = false
  default = "/subscriptions/be25820a-df86-4794-9e95-6a45cd5c0941/resourceGroups/swedencentral-vnet/providers/Microsoft.Network/virtualNetworks/swedencentral-vnet/subnets/default"
}

variable "log_analytics_sku" {
  description = "Specifies the SKU for the log analytics workspace"
  type        = string
  sensitive   = false
  default     = "PerGB2018"
}

variable "key_vault_sku" {
  description = "Specifies the SKU for the key vault"
  type        = string
  sensitive   = false
  default     = "premium"
}

variable "key_vault_name" {
  description = "Specifies the name of the key vault."
  type        = string
  sensitive   = false
  default     = "esp1-azsecret-eastus-kv"
  validation {
    condition     = length(var.key_vault_name) >= 2
    error_message = "Please specify a valid name."
  }
}

variable "log_analytics_name" {
  description = "Specifies the name of the log analytics workspace"
  type        = string
  sensitive   = false
  default     = "esp1azlogs-eastus-law"
    validation {
    condition     = length(var.log_analytics_name) >= 2
    error_message = "Please specify a valid name."
  }
}

variable "cognitive_service_name" {
  description = "Specifies the name of the cognitive service."
  type        = string
  sensitive   = false
  default     = "esp1azoai-eastus-ai"
  validation {
    condition     = length(var.cognitive_service_name) >= 2
    error_message = "Please specify a valid name."
  }
}

variable "user_assigned_identity_name" {
  description = "Specifies the name of the user assigned identity."
  type        = string
  sensitive   = false
  default     = "esp1-id-eastus-uai"
  validation {
    condition     = length(var.user_assigned_identity_name) >= 2
    error_message = "Please specify a valid name."
  }
}

variable "storage_account_name" {
  description = "Specifies the name of the storage account."
  type        = string
  default     = "esp1instai122311"
  sensitive   = false
  validation {
    condition     = length(var.storage_account_name) >= 2
    error_message = "Please specify a valid name."
  }
}

variable "partition_count" {
  description = "Specifies the number of partitions in the search service."
  type        = number
  sensitive   = false
  default     = 1
  
}

variable "replica_count" {
  description = "Specifies the number of replicas in the search service."
  type        = number
  sensitive   = false
  default     = 1
  
}

variable "search_service_name" {
  description = "Specifies the name of the search service."
  type        = string
  sensitive   = false
  default     = "esp1azsearcheastusss" #does not support '-' in name
  validation {
    condition     = length(var.search_service_name) >= 2
    error_message = "Please specify a valid name."
  }
  
}

variable "adf_service_name" {
  description = "Specifies the name of the data factory."
  type        = string
  sensitive   = false
  default     = "esp1azdf-eastus-adf"
  validation {
    condition     = length(var.adf_service_name) >= 2
    error_message = "Please specify a valid name."
  }
}