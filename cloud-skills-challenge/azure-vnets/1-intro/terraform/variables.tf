variable "resource_name_prefix" {
  type        = string
  description = "The prefix to add to resource names"
  default     = "vnet-csc-1"
}

variable "location" {
  type        = string
  description = "The resource location"
  default     = "UK South"
}

# VM
variable "database_vm" {
  type        = set(string)
  description = "The list of VMs to be deployed in the Database Subnet"
  default     = ["db-vm1", "db-vm2"]
}

variable "manufacturing_system_vm" {
  type        = set(string)
  description = "The list of VMs to be deployed in the Manufacturing System Subnet"
  default     = ["man-sys-vm1"]
}

# Key Vault
variable "kv_secret_permissions_full" {
  type        = list(string)
  description = "List of full secret permissions, must be one or more from the following: backup, delete, get, list, purge, recover, restore and set"
  default     = ["Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"]
}