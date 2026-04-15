output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "vm_public_ip" {
  value = module.network.public_ip_address
}

output "ssh_command" {
  value = "ssh ${var.admin_username}@${module.network.public_ip_address}"
}

output "migration_log_hint" {
  value = "After SSH: sudo tail -n 200 /var/log/mysql-migrate.log"
}
