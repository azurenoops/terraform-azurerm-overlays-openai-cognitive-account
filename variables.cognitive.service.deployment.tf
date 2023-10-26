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
      name = string
      version = string
    })
    scale = optional(object({
      type     = string
      tier     = string
      size     = string
      family   = string
      capacity = number
    }))
    rai_policy_name = string  
  }))
  default = [
    {
      name = "gpt-35-turbo"
      model = {
        name = "gpt-35-turbo"
        version = "0301"
      }
      scale = {
        type     = "Standard"
        tier     = "Free"
        size     = "S1"
        family   = "S"
        capacity = 1
      }
      rai_policy_name = ""
    }
  ] 
}

