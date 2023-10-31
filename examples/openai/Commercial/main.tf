
module "cognitive_account_openai" {
  source = "../../.."

  //version = "~> 1.0.0"

  depends_on = [azurerm_resource_group.openai-rg]

  //Global Settings
  # Resource Group, location, VNet and Subnet details
  existing_resource_group_name = azurerm_resource_group.openai-rg.name
  location                     = var.location
  environment                  = var.environment
  deploy_environment           = var.deploy_environment
  org_name                     = var.org_name
  workload_name                = var.workload_name

  sku_name                      = var.openai_sku_name
  deployments                   = var.openai_deployments
  custom_subdomain_name         = var.openai_custom_subdomain_name
  public_network_access_enabled = var.openai_public_network_access_enabled

  #  Private Endpoint Settings
  enable_private_endpoint       = true
  existing_virtual_network_name = azurerm_virtual_network.openai-vnet.name
  existing_private_subnet_name  = azurerm_subnet.openai-snet.name
  network_acls = {
    default_action = "Deny"
    subnet_id      = azurerm_subnet.openai-snet.id
    ip_rules       = ["${azurerm_subnet.openai-snet.address_prefixes[0]}"]
  }
}

