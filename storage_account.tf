resource "azurerm_storage_account" "clientfiles" {
  name                     = "clientfiles${var.region}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "Production"
    location    = var.location
  }
}