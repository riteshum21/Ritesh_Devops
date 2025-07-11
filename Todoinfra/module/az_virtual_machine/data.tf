data "azurerm_subnet" "frontsubnet" {
name = var.subnet_name
resource_group_name = var.rg_name
virtual_network_name = var.vnet_name
}

data "azurerm_public_ip" "pip" {
  name = var.pip_name
  resource_group_name = var.rg_name
}