resource "azurerm_postgresql_flexible_server" "db" {
  name                   = "db-${var.region}"
  resource_group_name    = azurerm_resource_group.rg.name
  location               = azurerm_resource_group.rg.location
  administrator_login    = "admin${var.region}"
  administrator_password = random_password.password.result
  storage_mb             = 131072
  version                = "14"
  sku_name               = "GP_Standard_D2s_v3"
  zone                   = "2"

}

#random password
resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_!?*" # override the default special characters
}

#output
output "password" {
  value = random_password.password.result
  sensitive = true
}