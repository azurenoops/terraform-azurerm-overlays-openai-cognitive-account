# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

resource "azurerm_role_assignment" "cognitive_services_user_assignment" {
  for_each                         = toset(var.identity_ids == null ? [] : var.identity_ids)
  scope                            = azurerm_cognitive_account.openai.id
  role_definition_name             = "Cognitive Services User"
  principal_id                     = each.value
  skip_service_principal_aad_check = true
}
