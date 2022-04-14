resource "azurerm_resource_group" "this" {
  name     = "${var.resource_name_prefix}-rg"
  location = var.location
}

module "database_vm" {
  for_each = var.database_vm

  source  = "./modules/win-vm"
  vm_name = each.value

  ip_configuration_name = "internal"
  subnet_id             = data.azurerm_subnet.database.id
  location              = azurerm_resource_group.this.location
  resource_group_name   = azurerm_resource_group.this.name
}

module "manufacturing_system_vm" {
  for_each = var.manufacturing_system_vm

  source  = "./modules/win-vm"
  vm_name = each.value

  ip_configuration_name = "internal"
  subnet_id             = data.azurerm_subnet.manufacturing_system.id
  location              = azurerm_resource_group.this.location
  resource_group_name   = azurerm_resource_group.this.name
}