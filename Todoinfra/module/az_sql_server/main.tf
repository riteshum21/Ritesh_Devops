
resource "azurerm_mssql_server" "sqlserver" {
  name                         = var.mssqlserver
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.username
  administrator_login_password = var.password
   
}

