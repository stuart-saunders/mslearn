resource "azurerm_virtual_network" "manufacturing" {
  name                = "${var.resource_name_prefix}-manufacturing-vnet"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  address_space       = ["10.30.0.0/16"]

  tags = {
    environment = "development"
    department  = "manufacturing"
  }
}

resource "azurerm_virtual_network_peering" "manufacturing_to_core" {
  name                      = "manufacturing-to-core-peering"
  resource_group_name       = azurerm_resource_group.this.name
  virtual_network_name      = azurerm_virtual_network.manufacturing.name
  remote_virtual_network_id = azurerm_virtual_network.core.id
}

resource "azurerm_subnet" "manufacturing_system" {
  name                 = "${var.resource_name_prefix}-manufacturing-system-subnet"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.manufacturing.name
  address_prefixes     = ["10.30.10.0/24"]
}

resource "azurerm_subnet" "sensor_1" {
  name                 = "${var.resource_name_prefix}-manufacturing-sensor1-subnet"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.manufacturing.name
  address_prefixes     = ["10.30.20.0/24"]
}

resource "azurerm_subnet" "sensor_2" {
  name                 = "${var.resource_name_prefix}-manufacturing-sensor2-subnet"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.manufacturing.name
  address_prefixes     = ["10.30.21.0/24"]
}

resource "azurerm_subnet" "sensor_3" {
  name                 = "${var.resource_name_prefix}-manufacturing-sensor3-subnet"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.manufacturing.name
  address_prefixes     = ["10.30.22.0/24"]
}