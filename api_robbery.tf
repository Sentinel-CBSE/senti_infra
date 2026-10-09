resource "azurerm_api_management_api" "res-25" {
  api_management_name = "senti-ag"
  description         = "API for creating and querying robbery reports."
  display_name        = "robbery"
  name                = "robbery"
  path                = "robbery"
  protocols           = ["https"]
  resource_group_name = azurerm_resource_group.res-0.name
  revision            = "1"
  service_url         = "https://senti-gestion-robos-ms.ashyfield-30fdc462.westus2.azurecontainerapps.io"
  depends_on = [
    azurerm_api_management.res-1,
  ]
}
resource "azurerm_api_management_api_operation" "res-26" {
  api_management_name = "senti-ag"
  api_name            = "robbery"
  description         = "Publishes a robbery report for asynchronous processing."
  display_name        = "Create robbery"
  method              = "POST"
  operation_id        = "create-robbery"
  resource_group_name = azurerm_resource_group.res-0.name
  url_template        = "/create"
  response {
    description = "Robbery report accepted for processing."
    status_code = 202
    representation {
      content_type = "application/json"
      schema_id    = "6ac1696603ed58145cc3a7db"
      type_name    = "RobberyAcceptedResponse"
      example {
        name = "default"
        value = jsonencode({
          eventId = "550e8400-e29b-41d4-a716-446655440000"
          status  = "published"
        })
      }
    }
  }
  response {
    description = "Unauthorized."
    status_code = 401
  }
  depends_on = [
    azurerm_api_management_api.res-25,
  ]
}
resource "azurerm_api_management_api_operation_policy" "res-27" {
  api_management_name = "senti-ag"
  api_name            = "robbery"
  operation_id        = "create-robbery"
  resource_group_name = azurerm_resource_group.res-0.name
  depends_on = [
    azurerm_api_management_api_operation.res-26,
  ]
}
resource "azurerm_api_management_api_operation" "res-28" {
  api_management_name = "senti-ag"
  api_name            = "robbery"
  description         = "Returns robbery reports within the specified geographic bounds and time range."
  display_name        = "List robberies"
  method              = "GET"
  operation_id        = "list-robberies"
  resource_group_name = azurerm_resource_group.res-0.name
  url_template        = "/list?northLat={northLat}&southLat={southLat}&eastLon={eastLon}&westLon={westLon}&from={from}&to={to}"
  response {
    description = "List of robbery reports."
    status_code = 200
    representation {
      content_type = "application/json"
      schema_id    = "6ac1696603ed58145cc3a7db"
      type_name    = "ListGet200ApplicationJsonResponse"
      example {
        name = "default"
        value = jsonencode([{
          id        = "robbery-123"
          latitude  = 4.6097
          longitude = -74.0817
          timestamp = 1759230000000
          type      = "robo"
        }])
      }
    }
  }
  response {
    description = "Unauthorized."
    status_code = 401
  }
  template_parameter {
    name      = "northLat"
    required  = true
    schema_id = "6ac1696603ed58145cc3a7db"
    type      = "number"
    type_name = "ListGetRequest"
  }
  template_parameter {
    name      = "southLat"
    required  = true
    schema_id = "6ac1696603ed58145cc3a7db"
    type      = "number"
    type_name = "ListGetRequest-1"
  }
  template_parameter {
    name      = "eastLon"
    required  = true
    schema_id = "6ac1696603ed58145cc3a7db"
    type      = "number"
    type_name = "ListGetRequest-2"
  }
  template_parameter {
    name      = "westLon"
    required  = true
    schema_id = "6ac1696603ed58145cc3a7db"
    type      = "number"
    type_name = "ListGetRequest-3"
  }
  template_parameter {
    name      = "from"
    required  = true
    schema_id = "6ac1696603ed58145cc3a7db"
    type      = "integer"
    type_name = "ListGetRequest-4"
  }
  template_parameter {
    name      = "to"
    required  = true
    schema_id = "6ac1696603ed58145cc3a7db"
    type      = "integer"
    type_name = "ListGetRequest-5"
  }
  depends_on = [
    azurerm_api_management_api.res-25,
  ]
}
resource "azurerm_api_management_api_operation_policy" "res-29" {
  api_management_name = "senti-ag"
  api_name            = "robbery"
  operation_id        = "list-robberies"
  resource_group_name = azurerm_resource_group.res-0.name
  depends_on = [
    azurerm_api_management_api_operation.res-28,
  ]
}
resource "azurerm_api_management_api_policy" "res-30" {
  api_management_name = "senti-ag"
  api_name            = "robbery"
  resource_group_name = azurerm_resource_group.res-0.name
  depends_on = [
    azurerm_api_management_api.res-25,
  ]
}
resource "azurerm_api_management_api_schema" "res-31" {
  api_management_name = "senti-ag"
  api_name            = "robbery"
  components = jsonencode({
    schemas = {
      ListGet200ApplicationJsonResponse = {
        items = {
          "$ref" = "#/components/schemas/RobberyPointDto"
        }
        type          = "array"
        x-apim-inline = true
      }
      ListGetRequest = {
        format        = "double"
        type          = "number"
        x-apim-inline = true
      }
      ListGetRequest-1 = {
        format        = "double"
        type          = "number"
        x-apim-inline = true
      }
      ListGetRequest-2 = {
        format        = "double"
        type          = "number"
        x-apim-inline = true
      }
      ListGetRequest-3 = {
        format        = "double"
        type          = "number"
        x-apim-inline = true
      }
      ListGetRequest-4 = {
        format        = "int64"
        type          = "integer"
        x-apim-inline = true
      }
      ListGetRequest-5 = {
        format        = "int64"
        type          = "integer"
        x-apim-inline = true
      }
      ListGetRequest-6 = {
        nullable      = true
        type          = "string"
        x-apim-inline = true
      }
      RobberyAcceptedResponse = {
        properties = {
          eventId = {
            example = "550e8400-e29b-41d4-a716-446655440000"
            type    = "string"
          }
          status = {
            example = "published"
            type    = "string"
          }
        }
        required = ["eventId", "status"]
        type     = "object"
      }
      RobberyPointDto = {
        properties = {
          id = {
            example = "robbery-123"
            type    = "string"
          }
          latitude = {
            example = 4.6097
            format  = "double"
            type    = "number"
          }
          longitude = {
            example = -74.0817
            format  = "double"
            type    = "number"
          }
          timestamp = {
            example  = 1759230000000
            format   = "int64"
            nullable = true
            type     = "integer"
          }
          type = {
            example  = "robo"
            nullable = true
            type     = "string"
          }
        }
        required = ["id", "latitude", "longitude"]
        type     = "object"
      }
      RobberyReportRequestDto = {
        properties = {
          latitude = {
            example = 4.6097
            format  = "double"
            type    = "number"
          }
          longitude = {
            example = -74.0817
            format  = "double"
            type    = "number"
          }
          timestamp = {
            example = 1759230000000
            format  = "int64"
            type    = "integer"
          }
          type = {
            example = "robo"
            type    = "string"
          }
        }
        required = ["type", "latitude", "longitude", "timestamp"]
        type     = "object"
      }
    }
  })
  content_type        = "application/vnd.oai.openapi.components+json"
  resource_group_name = azurerm_resource_group.res-0.name
  schema_id           = "6ac1696603ed58145cc3a7db"
  depends_on = [
    azurerm_api_management_api.res-25,
  ]
}
