resource "azurerm_api_management" "res-1" {
  location            = "eastus"
  name                = "senti-ag"
  publisher_email     = "david.alfonso.canas@gmail.com"
  publisher_name      = "sentinel"
  resource_group_name = azurerm_resource_group.res-0.name
  sku_name            = "Consumption_0"
  identity {
    type = "SystemAssigned"
  }
}
resource "azurerm_api_management_backend" "res-32" {
  api_management_name = "senti-ag"
  name                = "senti-datos-personales-ms"
  protocol            = "http"
  resource_group_name = azurerm_resource_group.res-0.name
  url                 = "https://senti-datos-personales-ms.ashyfield-30fdc462.westus2.azurecontainerapps.io"
  tls {
    validate_certificate_chain = true
    validate_certificate_name  = true
  }
  depends_on = [
    azurerm_api_management.res-1,
  ]
}
resource "azurerm_api_management_backend" "res-33" {
  api_management_name = "senti-ag"
  name                = "senti-eventos-mq"
  protocol            = "http"
  resource_group_name = azurerm_resource_group.res-0.name
  url                 = "https://senti-eventos-mq.eastus-1.eventgrid.azure.net/api/events"
  tls {
    validate_certificate_chain = true
    validate_certificate_name  = true
  }
  depends_on = [
    azurerm_api_management.res-1,
  ]
}
resource "azurerm_api_management_backend" "res-34" {
  api_management_name = "senti-ag"
  name                = "senti-gestion-robos-ms"
  protocol            = "http"
  resource_group_name = azurerm_resource_group.res-0.name
  url                 = "https://senti-gestion-robos-ms.ashyfield-30fdc462.westus2.azurecontainerapps.io"
  tls {
    validate_certificate_chain = true
    validate_certificate_name  = true
  }
  depends_on = [
    azurerm_api_management.res-1,
  ]
}
resource "azurerm_api_management_policy" "res-35" {
  api_management_id = azurerm_api_management.res-1.id
  xml_content       = "<!--\r\n    IMPORTANT:\r\n    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n    - Only the <forward-request> policy element can appear within the <backend> section element.\r\n    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n    - To add a policy position the cursor at the desired insertion point and click on the round button associated with the policy.\r\n    - To remove a policy, delete the corresponding policy statement from the policy document.\r\n    - Policies are applied in the order of their appearance, from the top down.\r\n-->\r\n<policies>\r\n\t<inbound></inbound>\r\n\t<backend>\r\n\t\t<forward-request />\r\n\t</backend>\r\n\t<outbound></outbound>\r\n</policies>"
}
resource "azurerm_api_management_subscription" "res-36" {
  allow_tracing       = false
  api_management_name = "senti-ag"
  display_name        = "Mobile access key"
  resource_group_name = azurerm_resource_group.res-0.name
  state               = "active"
  depends_on = [
    azurerm_api_management.res-1,
  ]
}
