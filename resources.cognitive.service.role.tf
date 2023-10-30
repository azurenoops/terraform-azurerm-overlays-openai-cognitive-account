# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

resource "azurerm_role_assignment" "cognitive_services_user_assignment" {
  count                            = var.user_assigned_identity_principal_id != null ? 1 : 0
  scope                            = azurerm_cognitive_account.openai.id
  role_definition_name             = "Cognitive Services User"
  principal_id                     = var.user_assigned_identity_principal_id
  skip_service_principal_aad_check = true
}
