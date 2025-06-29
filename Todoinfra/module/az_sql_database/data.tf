
  data "azurerm_mssql_server" "sqlserver" {
  name = var.mssqlserver
  resource_group_name = var.rg_name
}