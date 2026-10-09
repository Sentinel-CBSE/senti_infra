resource "azurerm_api_management_api" "res-2" {
  api_management_name = "senti-ag"
  description         = "API for publishing the authenticated user's current location."
  display_name        = "location"
  name                = "location"
  path                = "location"
  protocols           = ["https"]
  resource_group_name = azurerm_resource_group.res-0.name
  revision            = "1"
  service_url         = "https://senti-eventos-mq.eastus-1.eventgrid.azure.net/api/events"
  depends_on = [
    azurerm_api_management.res-1,
  ]
}
resource "azurerm_api_management_api_operation" "res-3" {
  api_management_name = "senti-ag"
  api_name            = "location"
  description         = "Publishes the authenticated user's current location through the event router."
  display_name        = "Publish current location"
  method              = "POST"
  operation_id        = "send-current-location"
  resource_group_name = azurerm_resource_group.res-0.name
  url_template        = "/current?latitude={latitude}&longitude={longitude}"
  response {
    description = "Location event accepted."
    status_code = 202
  }
  response {
    description = "Invalid location coordinates."
    status_code = 400
  }
  response {
    description = "Unauthorized."
    status_code = 401
  }
  template_parameter {
    description = "Current latitude."
    name        = "latitude"
    required    = true
    schema_id   = "6ac163c8425f1b063c82179f"
    type        = "number"
    type_name   = "CurrentPostRequest"
    example {
      name  = "default"
      value = "4.711"
    }
  }
  template_parameter {
    description = "Current longitude."
    name        = "longitude"
    required    = true
    schema_id   = "6ac163c8425f1b063c82179f"
    type        = "number"
    type_name   = "CurrentPostRequest-1"
    example {
      name  = "default"
      value = "-74.072"
    }
  }
  depends_on = [
    azurerm_api_management_api.res-2,
  ]
}
resource "azurerm_api_management_api_operation_policy" "res-4" {
  api_management_name = "senti-ag"
  api_name            = "location"
  operation_id        = "send-current-location"
  resource_group_name = azurerm_resource_group.res-0.name
  depends_on = [
    azurerm_api_management_api_operation.res-3,
  ]
}
resource "azurerm_api_management_api_policy" "res-5" {
  api_management_name = "senti-ag"
  api_name            = "location"
  resource_group_name = azurerm_resource_group.res-0.name
  depends_on = [
    azurerm_api_management_api.res-2,
  ]
}
resource "azurerm_api_management_api_schema" "res-6" {
  api_management_name = "senti-ag"
  api_name            = "location"
  components = jsonencode({
    schemas = {
      CurrentPostRequest = {
        format        = "double"
        maximum       = 90
        minimum       = -90
        type          = "number"
        x-apim-inline = true
      }
      CurrentPostRequest-1 = {
        format        = "double"
        maximum       = 180
        minimum       = -180
        type          = "number"
        x-apim-inline = true
      }
    }
  })
  content_type        = "application/vnd.oai.openapi.components+json"
  resource_group_name = azurerm_resource_group.res-0.name
  schema_id           = "6ac163c8425f1b063c82179f"
  depends_on = [
    azurerm_api_management_api.res-2,
  ]
}
