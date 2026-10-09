resource "azurerm_servicebus_namespace" "res-778" {
  location            = "eastus"
  name                = "senti-notificaciones-mq"
  resource_group_name = azurerm_resource_group.res-0.name
  sku                 = "Basic"
}
resource "azurerm_servicebus_namespace_authorization_rule" "res-779" {
  listen       = true
  manage       = true
  name         = "RootManageSharedAccessKey"
  namespace_id = azurerm_servicebus_namespace.res-778.id
  send         = true
}
resource "azurerm_servicebus_queue" "res-781" {
  name         = "senti-notificaciones"
  namespace_id = azurerm_servicebus_namespace.res-778.id
}
