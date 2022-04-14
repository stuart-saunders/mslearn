resource "azurerm_private_dns_zone" "this" {
  name                = "contoso.com"
  resource_group_name = azurerm_resource_group.this.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "core_dns_vnet_link" {
  name                  = "CoreVnetLink"
  resource_group_name   = azurerm_resource_group.this.name
  private_dns_zone_name = azurerm_private_dns_zone.this.name
  virtual_network_id    = azurerm_virtual_network.core.id
  registration_enabled  = true
}

resource "azurerm_private_dns_zone_virtual_network_link" "manufacturing_dns_vnet_link" {
  name                  = "ManufacturingVnetLink"
  resource_group_name   = azurerm_resource_group.this.name
  private_dns_zone_name = azurerm_private_dns_zone.this.name
  virtual_network_id    = azurerm_virtual_network.manufacturing.id
  registration_enabled  = true
}

resource "azurerm_private_dns_zone_virtual_network_link" "research_dns_vnet_link" {
  name                  = "ResearchVnetLink"
  resource_group_name   = azurerm_resource_group.this.name
  private_dns_zone_name = azurerm_private_dns_zone.this.name
  virtual_network_id    = azurerm_virtual_network.research.id
  registration_enabled  = true
}