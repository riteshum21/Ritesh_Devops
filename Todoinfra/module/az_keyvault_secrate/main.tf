
resource "azurerm_key_vault_secret" "kvs_name" {
  name         = var.key_secret
  value        = var.key_secret_value
  key_vault_id = azurerm_key_vault.example.id
}

