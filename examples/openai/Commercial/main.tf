
module "cognitive_account_openai" {
  source = "../../.."

  //version = "~> 1.0.0"

  depends_on = [ azurerm_resource_group.openai_rg ]

  //Global Settings
  # Resource Group, location, VNet and Subnet details
  existing_resource_group_name = azurerm_resource_group.openai_rg.name
  location                     = var.location
  environment                  = var.environment
  deploy_environment           = var.deploy_environment
  org_name                     = var.org_name
  workload_name                = var.workload_name

  sku_name                      = var.openai_sku_name
  deployments                   = var.openai_deployments
  custom_subdomain_name         = var.openai_custom_subdomain_name
  public_network_access_enabled = var.openai_public_network_access_enabled

  network_acls = {
    default_action = "Deny"
    ip_rules       = ["10.0.0.1"]
    subnet_id      = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-name/providers/Microsoft.Network/virtualNetworks/vnet-name/subnets/subnet-name"
  }
}