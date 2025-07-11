resource "azurerm_storage_account" "stg" {
  name                     = var.sg_name
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

