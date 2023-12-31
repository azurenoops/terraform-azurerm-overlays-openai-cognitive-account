# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

#####################################
# Cognitive Acount Configuration   ##
#####################################

# Add more variables as needed
variable "sku_name" {
  description = "(Optional) Specifies the sku name for the Azure OpenAI Service Possible values are F0, F1, S0, S, S1, S2, S3, S4, S5, S6, P0, P1, P2, E0 and DC0."
  type        = string
  default     = "S0"
}

variable "custom_subdomain_name" {
  description = "(Optional) Specifies the custom subdomain name of the Azure OpenAI Service"
  type        = string
}

#############################################
# Cognitive Acount Network Configuration   ##
#############################################

variable "public_network_access_enabled" {
  description = "(Optional) Specifies whether public network access is allowed for the Azure OpenAI Service"
  type        = bool
  default     = true
}

variable "network_acls" {
  description = "(Optional) Specifies the network ACLs for the Azure OpenAI Service. See https://www.terraform.io/docs/providers/azurerm/r/cognitive_account.html#network_acls for more information."
  type = object({
    default_action                       = optional(string, "Deny"),
    ip_rules                             = optional(list(string)),
    subnet_id                            = optional(string),
    ignore_missing_vnet_service_endpoint = optional(bool, false)
  })
  default = {}
}

#############################################
# Cognitive Acount CMK Configuration       ##
#############################################

variable "customer_managed_key" {
  description = "(Optional) Specifies the customer managed key for the Azure OpenAI Service. See https://www.terraform.io/docs/providers/azurerm/r/cognitive_account.html#customer_managed_key for more information.)"
  type = object({
    key_vault_key_id   = optional(string),
    identity_client_id = optional(string),
  })
  default = null
}

variable "storage" {
  description = "(Optional) Specifies the storage account for the Azure OpenAI Service. See https://www.terraform.io/docs/providers/azurerm/r/cognitive_account.html#storage for more information."
  type = object({
    storage_account_id = optional(string),
    identity_client_id = optional(string),
  })
  default = null
}

#############################################
# Cognitive Acount Identity Configuration  ##
#############################################

variable "identity_type" {
  description = "Specifies the type of Managed Service Identity that should be configured on this Cognitive Account. Possible values are `SystemAssigned`, `UserAssigned`, `SystemAssigned, UserAssigned` (to enable both)."
  type        = string
  default     = "SystemAssigned"
}

variable "identity_ids" {
  description = "Specifies a list of User Assigned Managed Identity IDs to be assigned to this Cognitive Account."
  type        = list(string)
  default     = null
}
