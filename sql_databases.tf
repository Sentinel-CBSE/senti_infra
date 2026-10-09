resource "azurerm_mssql_database_extended_auditing_policy" "res-797" {
  database_id            = "/subscriptions/246fb3a2-71ca-4779-9858-2e92aef6f9e2/resourceGroups/rg-sentinel/providers/Microsoft.Sql/servers/cbse-sentinel2026/databases/master"
  enabled                = false
  log_monitoring_enabled = false
}
resource "azurerm_mssql_database" "res-803" {
  name                 = "senti_datos_personales_db"
  server_id            = azurerm_mssql_server.res-782.id
  storage_account_type = "Local"
}
resource "azurerm_mssql_database_extended_auditing_policy" "res-814" {
  database_id            = azurerm_mssql_database.res-803.id
  enabled                = false
  log_monitoring_enabled = false
}
resource "azurerm_mssql_database" "res-820" {
  name                 = "senti_notificacion_db"
  server_id            = azurerm_mssql_server.res-782.id
  storage_account_type = "Local"
}
resource "azurerm_mssql_database_extended_auditing_policy" "res-831" {
  database_id            = azurerm_mssql_database.res-820.id
  enabled                = false
  log_monitoring_enabled = false
}
resource "azurerm_mssql_database" "res-837" {
  name                 = "sentirobosdb"
  server_id            = azurerm_mssql_server.res-782.id
  storage_account_type = "Local"
}
resource "azurerm_mssql_database_extended_auditing_policy" "res-848" {
  database_id            = azurerm_mssql_database.res-837.id
  enabled                = false
  log_monitoring_enabled = false
}
