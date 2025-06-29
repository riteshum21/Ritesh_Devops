
resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sql_server
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = var.sql_version
  administrator_login          = var.sql_login
  administrator_login_password = var.sql_password

}