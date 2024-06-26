output "cognitive_account_id" {
  description = "The ID of the cognitive service account."
  value       = azurerm_cognitive_account.cognitive_service.id
}

output "cognitive_account_endpoint" {
  description = "The base URL of the cognitive service account."
  value       = azurerm_cognitive_account.cognitive_service.endpoint
}

output "azurerm_cognitive_account_service_id" {
  description = "The ID of the cognitive service account."
  value       = azurerm_cognitive_account.cognitive_service.id
}

output "azurerm_cognitive_account_endpoint" {
  description = "The base URL of the cognitive service account."
  value       = azurerm_cognitive_account.cognitive_service.endpoint
}

output "azurerm_cognitive_account_principal_id" {
  description = "The principal id of the cognitive services account."
  sensitive   = false
  value       = azurerm_cognitive_account.cognitive_service.identity[0].principal_id
}