resource "azurerm_api_management_api" "res-7" {
  api_management_name = "senti-ag"
  description         = "API for registering the authenticated user's Firebase installation ID."
  display_name        = "notification"
  name                = "notification"
  path                = "notification"
  protocols           = ["https"]
  resource_group_name = azurerm_resource_group.res-0.name
  revision            = "1"
  service_url         = "https://senti-eventos-mq.eastus-1.eventgrid.azure.net/api/events"
  depends_on = [
    azurerm_api_management.res-1,
  ]
}
resource "azurerm_api_management_api_operation" "res-8" {
  api_management_name = "senti-ag"
  api_name            = "notification"
  description         = "Publishes an event to update the Firebase installation ID associated with the authenticated user."
  display_name        = "Register installation ID"
  method              = "POST"
  operation_id        = "register-installation-id"
  resource_group_name = azurerm_resource_group.res-0.name
  url_template        = "/registerInstallationId"
  response {
    description = "Installation ID update accepted."
    status_code = 202
  }
  response {
    description = "Invalid installation ID."
    status_code = 400
  }
  response {
    description = "Unauthorized."
    status_code = 401
  }
  depends_on = [
    azurerm_api_management_api.res-7,
  ]
}
resource "azurerm_api_management_api_operation_policy" "res-9" {
  api_management_name = "senti-ag"
  api_name            = "notification"
  operation_id        = "register-installation-id"
  resource_group_name = azurerm_resource_group.res-0.name
  depends_on = [
    azurerm_api_management_api_operation.res-8,
  ]
}
resource "azurerm_api_management_api_policy" "res-10" {
  api_management_name = "senti-ag"
  api_name            = "notification"
  resource_group_name = azurerm_resource_group.res-0.name
  depends_on = [
    azurerm_api_management_api.res-7,
  ]
}
resource "azurerm_api_management_api_schema" "res-11" {
  api_management_name = "senti-ag"
  api_name            = "notification"
  components = jsonencode({
    schemas = {
      InstallationIdRequest = {
        properties = {
          installationId = {
            description = "Firebase installation ID associated with the device."
            example     = "firebase-installation-id"
            type        = "string"
          }
        }
        required = ["installationId"]
        type     = "object"
      }
    }
  })
  content_type        = "application/vnd.oai.openapi.components+json"
  resource_group_name = azurerm_resource_group.res-0.name
  schema_id           = "6ac166ca016d7e109c615427"
  depends_on = [
    azurerm_api_management_api.res-7,
  ]
}
