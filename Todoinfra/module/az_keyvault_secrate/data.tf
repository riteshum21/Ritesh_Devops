data "azurerm_key_vault" "kv_name" {
 resource_group_name = var.rg_name
 name = var.kv_name
}