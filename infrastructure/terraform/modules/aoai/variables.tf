# General variables
variable "location" {
  description = "Specifies the location for all Azure resources."
  type        = string
  sensitive   = false
}

variable "resource_group_name" {
  description = "Specifies the name of the resource group."
  type        = string
  sensitive   = false
  validation {
    condition     = length(var.resource_group_name) >= 2
    error_message = "Please specify a valid name."
  }
}

variable "tags" {
  description = "Specifies the tags that you want to apply to all resources."
  type        = map(string)
  sensitive   = false
  default     = {}
}

variable "cognitive_service_name" {
  description = "Specifies the name of the cognitive service."
  type        = string
  sensitive   = false
  validation {
    condition     = length(var.cognitive_service_name) >= 2
    error_message = "Please specify a valid name."
  }
}

# Service variables
variable "cognitive_service_kind" {
  description = "Specifies the kind of the cognitive service."
  type        = string
  sensitive   = false
  validation {
    condition     = contains(["AnomalyDetector", "ComputerVision", "CognitiveServices", "ContentModerator", "CustomVision.Training", "CustomVision.Prediction", "Face", "FormRecognizer", "ImmersiveReader", "LUIS", "Personalizer", "SpeechServices", "TextAnalytics", "TextTranslation", "OpenAI"], var.cognitive_service_kind)
    error_message = "Please specify a valid kind."
  }
}

variable "cognitive_service_sku" {
  description = "Specifies the name of the cognitive service."
  type        = string
  sensitive   = false
  validation {
    condition     = length(var.cognitive_service_sku) >= 1
    error_message = "Please specify a valid sku name."
  }
}

variable "cognitive_service_deployments" {
  description = "Specifies the name of the GPT model."
  type = map(object({
    model_name             = string
    model_version          = string
    model_api_version      = optional(string, "2024-02-15-preview")
    version_upgrade_option = optional(string, "OnceCurrentVersionExpired")
    scale_type             = optional(string, "Standard")
    scale_size             = optional(string, null)
    scale_family           = optional(string, null)
    scale_capacity         = optional(number, 1)
  }))
  sensitive = false
  default   = {}
  # validation {
  #   condition = alltrue([
  #     length([for model_name in values(var.cognitive_service_deployments)[*].model_name : model_name if !contains(["value1", "value2"], model_name)]) <= 0
  #   ])
  #   error_message = "Please specify a valid model configuration."
  # }
}

# Monitoring variables
variable "log_analytics_workspace_id" {
  description = "Specifies the resource ID of the log analytics workspace used for the stamp"
  type        = string
  sensitive   = false
  validation {
    condition     = length(split("/", var.log_analytics_workspace_id)) == 9
    error_message = "Please specify a valid resource ID."
  }
}

# Network variables
variable "subnet_id" {
  description = "Specifies the subnet ID."
  type        = string
  sensitive   = false
}

# Customer-managed key variables
variable "customer_managed_key" {
  description = "Specifies the customer managed key configurations."
  type = object({
    key_vault_id                     = string,
    key_vault_key_versionless_id     = string,
    user_assigned_identity_id        = string,
    user_assigned_identity_client_id = string,
  })
  sensitive = false
  nullable  = true
  default   = null
  validation {
    condition = alltrue([
      var.customer_managed_key == null || length(split("/", try(var.customer_managed_key.key_vault_id, ""))) == 9,
      var.customer_managed_key == null || startswith(try(var.customer_managed_key.key_vault_key_versionless_id, ""), "https://"),
      var.customer_managed_key == null || length(split("/", try(var.customer_managed_key.user_assigned_identity_id, ""))) == 9,
      var.customer_managed_key == null || length(try(var.customer_managed_key.user_assigned_identity_client_id, "")) >= 2,
    ])
    error_message = "Please specify a valid resource ID."
  }
}
