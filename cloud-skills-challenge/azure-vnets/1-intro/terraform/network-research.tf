resource "azurerm_virtual_network" "research" {
  name                = "${var.resource_name_prefix}-research-vnet"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  address_space       = ["10.40.0.0/16"]
}

resource "azurerm_subnet" "research_system_subnet" {
  name                 = "${var.resource_name_prefix}-research-system-subnet"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.research.name
  address_prefixes     = ["10.40.0.0/24"]
}