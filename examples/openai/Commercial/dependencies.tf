# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

#---------------------------------------------------------
# Azure Region Lookup
#----------------------------------------------------------
module "mod_azure_region_lookup" {
  source  = "azurenoops/overlays-azregions-lookup/azurerm"
  version = "~> 1.0.0"

  azure_region = var.location
}

resource "azurerm_resource_group" "openai_rg" {
  name     = "rg-openai"
  location = module.mod_azure_region_lookup.location_cli
}