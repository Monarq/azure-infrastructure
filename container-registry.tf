# azure container registry

resource "azurerm_container_registry" "acr" {
  name                = "containerregistry${var.region}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
  tags = {
    Environment = "Production"
    location = var.location
  }
}