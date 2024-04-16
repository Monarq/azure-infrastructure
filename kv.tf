# azure key vault
data "azurerm_client_config" "current" {}
resource "azurerm_key_vault" "kv" {
  name                = "kv-${var.region}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  sku_name            = "standard"
  tenant_id = data.azurerm_client_config.current.tenant_id
  tags = {
    Environment = "Production"
    location = var.location
  }
}