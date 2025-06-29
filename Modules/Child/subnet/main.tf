
  resource "azurerm_subnet" "fsn" {
  name                 = var.subnet_name
  resource_group_name  = var.rg_name
  virtual_network_name = var.vn_name
  address_prefixes     = var.address_prefixes
  }

  
  # resource "azurerm_subnet" "bsn" {
  # name                 = var.subnet_name
  # resource_group_name  = var.rg_name
  # virtual_network_name = var.vn_name
  # address_prefixes     = var.address_prefixes
  # }