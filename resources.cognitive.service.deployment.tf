# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

#---------------------------------------------------------------
# Azure Cognitive Account Deployment
#----------------------------------------------------------------
resource "azurerm_cognitive_deployment" "deployment" {
  for_each = { for deployment in var.deployments : deployment.name => deployment }

  name                 = each.key
  cognitive_account_id = azurerm_cognitive_account.openai.id

  model {
    format  = "OpenAI"
    name    = each.value.model.name
    version = each.value.model.version
  }

  scale {
    type     = each.value.scale.type
    tier     = each.value.scale.tier
    size     = each.value.scale.size
    family   = each.value.scale.family
    capacity = each.value.scale.capacity
  }
}
