resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-rg"
  location = var.location
  tags     = var.tags
}

module "network" {
  source = "./modules/network"

  prefix              = var.prefix
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags
  vnet_address_space  = var.vnet_address_space
  subnet_prefixes     = var.subnet_prefixes
  allowed_ssh_cidr    = var.allowed_ssh_cidr
  allow_mysql_inbound = var.allow_mysql_inbound
  allowed_mysql_cidr  = var.allowed_mysql_cidr
}

module "linux_vm" {
  source = "./modules/linux_vm"

  prefix              = var.prefix
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags
  nic_id              = module.network.nic_id
  admin_username      = var.admin_username
  ssh_public_key      = var.ssh_public_key
  vm_size             = var.vm_size
  os_disk_type        = var.os_disk_type
  os_disk_size_gb     = var.os_disk_size_gb

  custom_data = base64encode(templatefile("${path.module}/cloud-init/mysql-migrate.yaml.tftpl", {
    source_mysql_database = var.source_mysql_database
  }))
}
