resource "azurerm_mssql_server" "res-782" {
  administrator_login          = "cbse-sentinel2026"
  administrator_login_password = var.db_password
  location                     = "westus2"
  name                         = "cbse-sentinel2026"
  resource_group_name          = azurerm_resource_group.res-0.name
  version                      = "12.0"
  azuread_administrator {
    login_username = "david.alfonso.canas_gmail.com#EXT#@davidalfonsocanasgmail.onmicrosoft.com"
    object_id      = "5aade3f9-9c2d-4225-892d-151805b63f97"
  }
}
resource "azurerm_mssql_server_microsoft_support_auditing_policy" "res-854" {
  enabled                = false
  log_monitoring_enabled = false
  server_id              = azurerm_mssql_server.res-782.id
}
resource "azurerm_mssql_server_transparent_data_encryption" "res-855" {
  server_id = azurerm_mssql_server.res-782.id
}
resource "azurerm_mssql_server_extended_auditing_policy" "res-856" {
  enabled                = false
  log_monitoring_enabled = false
  server_id              = azurerm_mssql_server.res-782.id
}
resource "azurerm_mssql_firewall_rule" "res-857" {
  end_ip_address   = "0.0.0.0"
  name             = "AllowAllWindowsAzureIps"
  server_id        = azurerm_mssql_server.res-782.id
  start_ip_address = "0.0.0.0"
}
resource "azurerm_mssql_firewall_rule" "res-858" {
  end_ip_address   = "168.176.40.179"
  name             = "ClientIPAddress_2026-10-1_17-56-14"
  server_id        = azurerm_mssql_server.res-782.id
  start_ip_address = "168.176.40.179"
}
resource "azurerm_mssql_firewall_rule" "res-859" {
  end_ip_address   = "186.29.181.38"
  name             = "ClientIPAddress_2026-10-2_16-10-11"
  server_id        = azurerm_mssql_server.res-782.id
  start_ip_address = "186.29.181.38"
}
resource "azurerm_mssql_firewall_rule" "res-860" {
  end_ip_address   = "152.204.180.89"
  name             = "ClientIPAddress_2026-10-2_9-40-3"
  server_id        = azurerm_mssql_server.res-782.id
  start_ip_address = "152.204.180.89"
}
resource "azurerm_mssql_firewall_rule" "res-861" {
  end_ip_address   = "190.253.135.96"
  name             = "QueryEditorClientIPAddress_1789912095423"
  server_id        = azurerm_mssql_server.res-782.id
  start_ip_address = "190.253.135.96"
}
resource "azurerm_mssql_firewall_rule" "res-862" {
  end_ip_address   = "186.154.65.29"
  name             = "QueryEditorClientIPAddress_1790902222386"
  server_id        = azurerm_mssql_server.res-782.id
  start_ip_address = "186.154.65.29"
}
resource "azurerm_mssql_firewall_rule" "res-863" {
  end_ip_address   = "186.29.186.49"
  name             = "QueryEditorClientIPAddress_1791062356481"
  server_id        = azurerm_mssql_server.res-782.id
  start_ip_address = "186.29.186.49"
}
resource "azurerm_mssql_firewall_rule" "res-864" {
  end_ip_address   = "152.203.147.244"
  name             = "QueryEditorClientIPAddress_1791063780162"
  server_id        = azurerm_mssql_server.res-782.id
  start_ip_address = "152.203.147.244"
}
resource "azurerm_mssql_firewall_rule" "res-865" {
  end_ip_address   = "168.176.40.188"
  name             = "QueryEditorClientIPAddress_1791243164654"
  server_id        = azurerm_mssql_server.res-782.id
  start_ip_address = "168.176.40.188"
}
resource "azurerm_mssql_server_security_alert_policy" "res-867" {
  resource_group_name = azurerm_resource_group.res-0.name
  server_name         = "cbse-sentinel2026"
  state               = "Disabled"
  depends_on = [
    azurerm_mssql_server.res-782,
  ]
}
