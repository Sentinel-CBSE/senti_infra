resource "azurerm_log_analytics_workspace" "res-49" {
  location            = "westus2"
  name                = "workspacergsentinel90ce"
  resource_group_name = azurerm_resource_group.res-0.name
}
