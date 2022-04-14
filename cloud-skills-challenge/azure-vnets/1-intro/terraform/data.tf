data "azurerm_client_config" "current" {}

data "azurerm_virtual_network" "core" {
  name                = azurerm_virtual_network.core.name
  resource_group_name = azurerm_resource_group.this.name
}

data "azurerm_virtual_network" "manufacturing" {
  name                = azurerm_virtual_network.manufacturing.name
  resource_group_name = azurerm_resource_group.this.name
}

data "azurerm_subnet" "database" {
  name                 = azurerm_subnet.database.name
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = data.azurerm_virtual_network.core.name
}

data "azurerm_subnet" "manufacturing_system" {
  name                 = azurerm_subnet.manufacturing_system.name
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = data.azurerm_virtual_network.manufacturing.name
}