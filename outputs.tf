output "resource_group" {
  value = azurerm_resource_group.rg
}

output "db_fqdn" {
  value = azurerm_postgresql_server.db.fqdn
}