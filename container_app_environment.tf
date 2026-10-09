resource "azurerm_container_app_environment" "res-43" {
  location                   = "westus2"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-49.id
  name                       = "managedEnvironment-rgsentinel-a121"
  resource_group_name        = azurerm_resource_group.res-0.name
  workload_profile {
    name                  = "Consumption"
    workload_profile_type = "Consumption"
  }
}
