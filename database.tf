resource "azurerm_postgresql_server" "db" {
  name                = "saurav-tf-postgres"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  administrator_login          = var.db_admin_username
  administrator_login_password = var.db_admin_password

  sku_name   = "GP_Gen5_4"
  version    = "10.0"
  storage_mb = 5120

  backup_retention_days        = 7
  geo_redundant_backup_enabled = true
  auto_grow_enabled            = true

  public_network_access_enabled    = true
  ssl_enforcement_enabled          = true
  ssl_minimal_tls_version_enforced = "TLS1_2"
}

resource "azurerm_postgresql_firewall_rule" "example" {
  name                = "admin"
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_postgresql_server.db.name
  start_ip_address    = var.db_admin_allowed_ip
  end_ip_address      = var.db_admin_allowed_ip
}