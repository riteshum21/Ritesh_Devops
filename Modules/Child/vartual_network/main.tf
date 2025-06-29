
  resource "azurerm_virtual_network" "rgvn" {
  name                = var.vn_name
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = var.address_space
  }