resource "azurerm_eventgrid_topic" "res-44" {
  location            = "eastus"
  name                = "senti-eventos-mq"
  resource_group_name = azurerm_resource_group.res-0.name
}
