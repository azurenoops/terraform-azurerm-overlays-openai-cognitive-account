# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

################################################
# Cognitive Acount Deployment Configuration   ##
################################################

variable "deployments" {
  description = "(Optional) Specifies the deployments of the Azure OpenAI Service"
  type = list(object({
    name = string
    model = object({
      name    = string
      version = string
    })
    scale = optional(object({
      type     = optional(string)
      tier     = optional(string)
      size     = optional(string)
      family   = optional(string)
      capacity = optional(number)
    }))
    rai_policy_name = string
  }))
  default = [
    {
      name = "gpt-35-turbo"
      model = {
        name    = "gpt-35-turbo"
        version = "0301"
      }
      scale = {
        type = "Standard"
      }
      rai_policy_name = ""
    }
  ]
}


