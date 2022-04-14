resource "azurerm_virtual_network" "core" {
  name                = "${var.resource_name_prefix}-core-vnet"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  address_space       = ["10.20.0.0/16"]
}

resource "azurerm_virtual_network_peering" "core_to_manufacturing" {
  name                      = "core-to-manufacturing-peering"
  resource_group_name       = azurerm_resource_group.this.name
  virtual_network_name      = azurerm_virtual_network.core.name
  remote_virtual_network_id = azurerm_virtual_network.manufacturing.id
}

resource "azurerm_subnet" "gateway" {
  name                 = "${var.resource_name_prefix}-gateway-subnet"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.core.name
  address_prefixes     = ["10.20.0.0/27"]
}

resource "azurerm_subnet" "shared_services" {
  name                 = "${var.resource_name_prefix}-shared-services-subnet"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.core.name
  address_prefixes     = ["10.20.10.0/24"]
}

resource "azurerm_subnet" "database" {
  name                 = "${var.resource_name_prefix}-database-subnet"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.core.name
  address_prefixes     = ["10.20.20.0/24"]
}

resource "azurerm_subnet" "web_service" {
  name                 = "${var.resource_name_prefix}-web-service-subnet"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.core.name
  address_prefixes     = ["10.20.30.0/24"]
}