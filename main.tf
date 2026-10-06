resource "azurerm_resource_group" "res-0" {
  location = "eastus"
  name     = "rg-sentinel"
}
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
resource "azurerm_api_management_api" "res-12" {
  api_management_name = "senti-ag"
  description         = "API for managing the authenticated user's profile and emergency contacts."
  display_name        = "profile"
  name                = "profile"
  path                = "profile"
  protocols           = ["https"]
  resource_group_name = azurerm_resource_group.res-0.name
  revision            = "1"
  service_url         = "https://senti-datos-personales-ms.ashyfield-30fdc462.westus2.azurecontainerapps.io"
  depends_on = [
    azurerm_api_management.res-1,
  ]
}
resource "azurerm_api_management_api_operation" "res-13" {
  api_management_name = "senti-ag"
  api_name            = "profile"
  description         = "Adds an emergency contact to the authenticated user's profile."
  display_name        = "Add emergency contact"
  method              = "POST"
  operation_id        = "add-emergency-contact"
  resource_group_name = azurerm_resource_group.res-0.name
  url_template        = "/emergency-contacts"
  response {
    description = "Emergency contact added."
    status_code = 200
    representation {
      content_type = "application/json"
      schema_id    = "6ac167d53950990328193a5b"
      type_name    = "UserDto"
      example {
        name = "default"
        value = jsonencode({
          bloodTypeLetter = "O"
          bloodTypeRh     = "POSITIVE"
          emergencyContacts = [{
            name         = "Carlos Pérez"
            phoneNumber  = "+573001234567"
            relationship = "Father"
            uid          = "contact-123"
          }]
          eps = "SURA"
          uid = "firebase-user-uid"
        })
      }
    }
  }
  response {
    description = "Invalid emergency contact data."
    status_code = 400
  }
  response {
    description = "Unauthorized."
    status_code = 401
  }
  response {
    description = "User not found."
    status_code = 404
  }
  depends_on = [
    azurerm_api_management_api.res-12,
  ]
}
resource "azurerm_api_management_api_operation_policy" "res-14" {
  api_management_name = "senti-ag"
  api_name            = "profile"
  operation_id        = "add-emergency-contact"
  resource_group_name = azurerm_resource_group.res-0.name
  depends_on = [
    azurerm_api_management_api_operation.res-13,
  ]
}
resource "azurerm_api_management_api_operation" "res-15" {
  api_management_name = "senti-ag"
  api_name            = "profile"
  description         = "Deletes an emergency contact belonging to the authenticated user."
  display_name        = "Delete emergency contact"
  method              = "DELETE"
  operation_id        = "delete-emergency-contact"
  resource_group_name = azurerm_resource_group.res-0.name
  url_template        = "/emergency-contacts/{uid}"
  response {
    description = "Emergency contact deleted."
    status_code = 200
    representation {
      content_type = "application/json"
      schema_id    = "6ac167d53950990328193a5b"
      type_name    = "UserDto"
      example {
        name = "default"
        value = jsonencode({
          bloodTypeLetter = "O"
          bloodTypeRh     = "POSITIVE"
          emergencyContacts = [{
            name         = "Carlos Pérez"
            phoneNumber  = "+573001234567"
            relationship = "Father"
            uid          = "contact-123"
          }]
          eps = "SURA"
          uid = "firebase-user-uid"
        })
      }
    }
  }
  response {
    description = "Unauthorized."
    status_code = 401
  }
  response {
    description = "Emergency contact not found."
    status_code = 404
  }
  template_parameter {
    name      = "uid"
    required  = true
    schema_id = "6ac167d53950990328193a5b"
    type      = "string"
    type_name = "Emergency-contacts-uid-DeleteRequest"
    example {
      name  = "default"
      value = "contact-123"
    }
  }
  depends_on = [
    azurerm_api_management_api.res-12,
  ]
}
resource "azurerm_api_management_api_operation_policy" "res-16" {
  api_management_name = "senti-ag"
  api_name            = "profile"
  operation_id        = "delete-emergency-contact"
  resource_group_name = azurerm_resource_group.res-0.name
  depends_on = [
    azurerm_api_management_api_operation.res-15,
  ]
}
resource "azurerm_api_management_api_operation" "res-17" {
  api_management_name = "senti-ag"
  api_name            = "profile"
  description         = "Retrieves the profile data of the authenticated user."
  display_name        = "Get profile"
  method              = "GET"
  operation_id        = "get-profile"
  resource_group_name = azurerm_resource_group.res-0.name
  url_template        = "/data"
  response {
    description = "User profile retrieved."
    status_code = 200
    representation {
      content_type = "application/json"
      schema_id    = "6ac167d53950990328193a5b"
      type_name    = "UserDto"
      example {
        name = "default"
        value = jsonencode({
          bloodTypeLetter = "O"
          bloodTypeRh     = "POSITIVE"
          emergencyContacts = [{
            name         = "Carlos Pérez"
            phoneNumber  = "+573001234567"
            relationship = "Father"
            uid          = "contact-123"
          }]
          eps = "SURA"
          uid = "firebase-user-uid"
        })
      }
    }
  }
  response {
    description = "Unauthorized."
    status_code = 401
  }
  response {
    description = "User not found."
    status_code = 404
  }
  depends_on = [
    azurerm_api_management_api.res-12,
  ]
}
resource "azurerm_api_management_api_operation_policy" "res-18" {
  api_management_name = "senti-ag"
  api_name            = "profile"
  operation_id        = "get-profile"
  resource_group_name = azurerm_resource_group.res-0.name
  depends_on = [
    azurerm_api_management_api_operation.res-17,
  ]
}
resource "azurerm_api_management_api_operation" "res-19" {
  api_management_name = "senti-ag"
  api_name            = "profile"
  description         = "Updates an emergency contact belonging to the authenticated user."
  display_name        = "Update emergency contact"
  method              = "PUT"
  operation_id        = "update-emergency-contact"
  resource_group_name = azurerm_resource_group.res-0.name
  url_template        = "/emergency-contacts/{uid}"
  response {
    description = "Emergency contact updated."
    status_code = 200
    representation {
      content_type = "application/json"
      schema_id    = "6ac167d53950990328193a5b"
      type_name    = "UserDto"
      example {
        name = "default"
        value = jsonencode({
          bloodTypeLetter = "O"
          bloodTypeRh     = "POSITIVE"
          emergencyContacts = [{
            name         = "Carlos Pérez"
            phoneNumber  = "+573001234567"
            relationship = "Father"
            uid          = "contact-123"
          }]
          eps = "SURA"
          uid = "firebase-user-uid"
        })
      }
    }
  }
  response {
    description = "Invalid emergency contact data."
    status_code = 400
  }
  response {
    description = "Unauthorized."
    status_code = 401
  }
  response {
    description = "Emergency contact not found."
    status_code = 404
  }
  template_parameter {
    name      = "uid"
    required  = true
    schema_id = "6ac167d53950990328193a5b"
    type      = "string"
    type_name = "Emergency-contacts-uid-PutRequest"
    example {
      name  = "default"
      value = "contact-123"
    }
  }
  depends_on = [
    azurerm_api_management_api.res-12,
  ]
}
resource "azurerm_api_management_api_operation_policy" "res-20" {
  api_management_name = "senti-ag"
  api_name            = "profile"
  operation_id        = "update-emergency-contact"
  resource_group_name = azurerm_resource_group.res-0.name
  depends_on = [
    azurerm_api_management_api_operation.res-19,
  ]
}
resource "azurerm_api_management_api_operation" "res-21" {
  api_management_name = "senti-ag"
  api_name            = "profile"
  description         = "Updates the profile data of the authenticated user."
  display_name        = "Update profile"
  method              = "PUT"
  operation_id        = "update-profile"
  resource_group_name = azurerm_resource_group.res-0.name
  url_template        = "/data"
  response {
    description = "Updated user profile."
    status_code = 200
    representation {
      content_type = "application/json"
      schema_id    = "6ac167d53950990328193a5b"
      type_name    = "UserDto"
      example {
        name = "default"
        value = jsonencode({
          bloodTypeLetter = "O"
          bloodTypeRh     = "POSITIVE"
          emergencyContacts = [{
            name         = "Carlos Pérez"
            phoneNumber  = "+573001234567"
            relationship = "Father"
            uid          = "contact-123"
          }]
          eps = "SURA"
          uid = "firebase-user-uid"
        })
      }
    }
  }
  response {
    description = "Invalid profile data."
    status_code = 400
  }
  response {
    description = "Unauthorized."
    status_code = 401
  }
  response {
    description = "User not found."
    status_code = 404
  }
  depends_on = [
    azurerm_api_management_api.res-12,
  ]
}
resource "azurerm_api_management_api_operation_policy" "res-22" {
  api_management_name = "senti-ag"
  api_name            = "profile"
  operation_id        = "update-profile"
  resource_group_name = azurerm_resource_group.res-0.name
  depends_on = [
    azurerm_api_management_api_operation.res-21,
  ]
}
resource "azurerm_api_management_api_policy" "res-23" {
  api_management_name = "senti-ag"
  api_name            = "profile"
  resource_group_name = azurerm_resource_group.res-0.name
  depends_on = [
    azurerm_api_management_api.res-12,
  ]
}
resource "azurerm_api_management_api_schema" "res-24" {
  api_management_name = "senti-ag"
  api_name            = "profile"
  components = jsonencode({
    schemas = {
      Emergency-contacts-uid-DeleteRequest = {
        type          = "string"
        x-apim-inline = true
      }
      Emergency-contacts-uid-PutRequest = {
        type          = "string"
        x-apim-inline = true
      }
      EmergencyContactDto = {
        properties = {
          name = {
            example = "Carlos Pérez"
            type    = "string"
          }
          phoneNumber = {
            example = "+573001234567"
            type    = "string"
          }
          relationship = {
            example = "Father"
            type    = "string"
          }
          uid = {
            example = "contact-123"
            type    = "string"
          }
        }
        type = "object"
      }
      EmergencyContactRequestDto = {
        properties = {
          name = {
            example = "Carlos Pérez"
            type    = "string"
          }
          phoneNumber = {
            example = "+573001234567"
            type    = "string"
          }
          relationship = {
            example = "Father"
            type    = "string"
          }
        }
        required = ["name", "phoneNumber", "relationship"]
        type     = "object"
      }
      UserDto = {
        properties = {
          bloodTypeLetter = {
            enum    = ["A", "B", "AB", "O"]
            example = "O"
            type    = "string"
          }
          bloodTypeRh = {
            enum    = ["POSITIVE", "NEGATIVE"]
            example = "POSITIVE"
            type    = "string"
          }
          emergencyContacts = {
            items = {
              "$ref" = "#/components/schemas/EmergencyContactDto"
            }
            type = "array"
          }
          eps = {
            example  = "SURA"
            nullable = true
            type     = "string"
          }
          uid = {
            example = "firebase-user-uid"
            type    = "string"
          }
        }
        required = ["uid", "bloodTypeRh", "bloodTypeLetter", "emergencyContacts"]
        type     = "object"
      }
      UserUpdateDto = {
        properties = {
          bloodTypeLetter = {
            enum     = ["A", "B", "AB", "O"]
            example  = "O"
            nullable = true
            type     = "string"
          }
          bloodTypeRh = {
            enum     = ["POSITIVE", "NEGATIVE"]
            example  = "POSITIVE"
            nullable = true
            type     = "string"
          }
          eps = {
            example  = "SURA"
            nullable = true
            type     = "string"
          }
        }
        type = "object"
      }
    }
  })
  content_type        = "application/vnd.oai.openapi.components+json"
  resource_group_name = azurerm_resource_group.res-0.name
  schema_id           = "6ac167d53950990328193a5b"
  depends_on = [
    azurerm_api_management_api.res-12,
  ]
}
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
resource "azurerm_container_app" "res-38" {
  container_app_environment_id = azurerm_container_app_environment.res-43.id
  max_inactive_revisions       = 100
  name                         = "senti-datos-personales-ms"
  resource_group_name          = azurerm_resource_group.res-0.name
  revision_mode                = "Single"
  workload_profile_name        = "Consumption"
  ingress {
    client_certificate_mode = "ignore"
    external_enabled        = true
    target_port             = 3000
    traffic_weight {
      latest_revision = true
      percentage      = 100
    }
  }
  registry {
    password_secret_name = "reg-pswd-1bc0b56e-9aa0"
    server               = "registry.hub.docker.com"
    username             = var.dockerhub_username
  }
  secret {
    name  = "db-password"
    value = var.db_password
  }
  secret {
    name  = "reg-pswd-1bc0b56e-9aa0"
    value = var.dockerhub_token
  }
  template {
    cooldown_period_in_seconds = 120
    max_replicas               = 1
    min_replicas               = 0
    container {
      cpu    = 0.25
      image  = "${var.image_repository}/senti_datos_personales_ms:${var.senti_datos_personales_image_tag}"
      memory = "0.5Gi"
      name   = "senti-datos-personales-ms"
      env {
        name  = "PORT"
        value = "3000"
      }
      env {
        name  = "DB_HOST"
        value = "cbse-sentinel2026.database.windows.net"
      }
      env {
        name  = "DB_PORT"
        value = "1433"
      }
      env {
        name  = "DB_USERNAME"
        value = "cbse-sentinel2026"
      }
      env {
        name  = "DB_ENCRYPT"
        value = "true"
      }
      env {
        name  = "DB_TRUST_SERVER_CERTIFICATE"
        value = "false"
      }
      env {
        name  = "DB_DATABASE"
        value = "senti_datos_personales_db"
      }
      env {
        name        = "DB_PASSWORD"
        secret_name = "db-password"
      }
      liveness_probe {
        initial_delay = 0
        port          = 3000
        timeout       = 5
        transport     = "TCP"
      }
      readiness_probe {
        failure_count_threshold = 48
        interval_seconds        = 5
        port                    = 3000
        success_count_threshold = 1
        timeout                 = 5
        transport               = "TCP"
      }
      startup_probe {
        failure_count_threshold = 240
        initial_delay           = 1
        interval_seconds        = 1
        port                    = 3000
        timeout                 = 3
        transport               = "TCP"
      }
    }
    http_scale_rule {
      concurrent_requests = "10"
      name                = "http-scaler"
    }
  }
}
resource "azurerm_container_app" "res-39" {
  container_app_environment_id = azurerm_container_app_environment.res-43.id
  max_inactive_revisions       = 100
  name                         = "senti-geolocalizacion-db"
  resource_group_name          = azurerm_resource_group.res-0.name
  revision_mode                = "Single"
  workload_profile_name        = "Consumption"
  ingress {
    target_port = 6379
    transport   = "tcp"
    traffic_weight {
      latest_revision = true
      percentage      = 100
    }
  }
  template {
    max_replicas = 1
    min_replicas = 0
    container {
      cpu    = 0.25
      image  = "mcr.microsoft.com/azure-redis-cache/redis:latest"
      memory = "0.5Gi"
      name   = "redis-container"
      liveness_probe {
        initial_delay = 0
        port          = 6379
        timeout       = 5
        transport     = "TCP"
      }
      readiness_probe {
        failure_count_threshold = 48
        interval_seconds        = 5
        port                    = 6379
        success_count_threshold = 1
        timeout                 = 5
        transport               = "TCP"
      }
      startup_probe {
        failure_count_threshold = 240
        initial_delay           = 1
        interval_seconds        = 1
        port                    = 6379
        timeout                 = 3
        transport               = "TCP"
      }
    }
    http_scale_rule {
      concurrent_requests = "10"
      name                = "http-scaler"
    }
    tcp_scale_rule {
      concurrent_requests = "10"
      name                = "tcp-scaler"
    }
  }
  # Azure has this rule with no connection count, which the provider rejects.
  # Ignoring it keeps Terraform from pushing the placeholder and restarting Redis.
  lifecycle {
    ignore_changes = [template[0].tcp_scale_rule]
  }
}
resource "azurerm_container_app" "res-40" {
  container_app_environment_id = azurerm_container_app_environment.res-43.id
  max_inactive_revisions       = 100
  name                         = "senti-geolocalizacion-ms"
  resource_group_name          = azurerm_resource_group.res-0.name
  revision_mode                = "Single"
  workload_profile_name        = "Consumption"
  ingress {
    client_certificate_mode = "ignore"
    external_enabled        = true
    target_port             = 8000
    traffic_weight {
      latest_revision = true
      percentage      = 100
    }
  }
  registry {
    password_secret_name = "reg-pswd-8067a1d1-84fe"
    server               = "registry.hub.docker.com"
    username             = var.dockerhub_username
  }
  secret {
    name  = "reg-pswd-8067a1d1-84fe"
    value = var.dockerhub_token
  }
  secret {
    name  = "service-bus-connection-string"
    value = var.servicebus_connection_string
  }
  template {
    cooldown_period_in_seconds = 120
    max_replicas               = 1
    min_replicas               = 0
    container {
      cpu    = 0.25
      image  = "${var.image_repository}/senti_geolocalizacion_ms:${var.senti_geolocalizacion_image_tag}"
      memory = "0.5Gi"
      name   = "senti-geolocalizacion-ms"
      env {
        name  = "REDIS_URL"
        value = "redis://senti-geolocalizacion-db:6379"
      }
      env {
        name  = "REDIS_TIMEOUT_SECONDS"
        value = "5.0"
      }
      env {
        name  = "LOCATION_KEY"
        value = "users_location"
      }
      env {
        name  = "RADIUS_ALERT"
        value = "11000"
      }
      env {
        name  = "RADIUS_UNITY"
        value = "M"
      }
      env {
        name        = "CONNECTION_STR"
        secret_name = "service-bus-connection-string"
      }
      env {
        name  = "QUEUE_NAME"
        value = "senti-notificaciones"
      }
      env {
        name  = "DEBUG"
        value = "true"
      }
      liveness_probe {
        initial_delay = 0
        port          = 8000
        timeout       = 5
        transport     = "TCP"
      }
      readiness_probe {
        failure_count_threshold = 48
        interval_seconds        = 5
        port                    = 8000
        success_count_threshold = 1
        timeout                 = 5
        transport               = "TCP"
      }
      startup_probe {
        failure_count_threshold = 240
        initial_delay           = 1
        interval_seconds        = 1
        port                    = 8000
        timeout                 = 3
        transport               = "TCP"
      }
    }
    http_scale_rule {
      concurrent_requests = "10"
      name                = "http-scaler"
    }
  }
}
resource "azurerm_container_app" "res-41" {
  container_app_environment_id = azurerm_container_app_environment.res-43.id
  max_inactive_revisions       = 100
  name                         = "senti-gestion-robos-ms"
  resource_group_name          = azurerm_resource_group.res-0.name
  revision_mode                = "Single"
  workload_profile_name        = "Consumption"
  ingress {
    client_certificate_mode = "ignore"
    external_enabled        = true
    target_port             = 8080
    traffic_weight {
      latest_revision = true
      percentage      = 100
    }
  }
  registry {
    password_secret_name = "reg-pswd-709d69a9-a3cb"
    server               = "registry.hub.docker.com"
    username             = var.dockerhub_username
  }
  secret {
    name  = "connection-strings-sentirobosdb"
    value = "Server=tcp:cbse-sentinel2026.database.windows.net,1433;Initial Catalog=sentirobosdb;Persist Security Info=False;User ID=cbse-sentinel2026;Password=${var.db_password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
  }
  secret {
    name  = "reg-pswd-709d69a9-a3cb"
    value = var.dockerhub_token
  }
  template {
    cooldown_period_in_seconds = 120
    max_replicas               = 1
    container {
      cpu    = 0.25
      image  = "${var.image_repository}/senti_gestion_robos_ms:${var.senti_gestion_robos_image_tag}"
      memory = "0.5Gi"
      name   = "senti-gestion-robos-ms"
      env {
        name        = "ConnectionStrings__sentirobosdb"
        secret_name = "connection-strings-sentirobosdb"
      }
      liveness_probe {
        initial_delay = 0
        port          = 8080
        timeout       = 5
        transport     = "TCP"
      }
      readiness_probe {
        failure_count_threshold = 48
        interval_seconds        = 5
        port                    = 8080
        success_count_threshold = 1
        timeout                 = 5
        transport               = "TCP"
      }
      startup_probe {
        failure_count_threshold = 240
        initial_delay           = 1
        interval_seconds        = 1
        port                    = 8080
        timeout                 = 3
        transport               = "TCP"
      }
    }
    http_scale_rule {
      concurrent_requests = "10"
      name                = "http-scaler"
    }
  }
}
resource "azurerm_container_app" "res-42" {
  container_app_environment_id = azurerm_container_app_environment.res-43.id
  max_inactive_revisions       = 100
  name                         = "senti-notificacion-ms"
  resource_group_name          = azurerm_resource_group.res-0.name
  revision_mode                = "Single"
  workload_profile_name        = "Consumption"
  identity {
    type = "SystemAssigned"
  }
  ingress {
    client_certificate_mode = "ignore"
    external_enabled        = true
    target_port             = 8000
    traffic_weight {
      latest_revision = true
      percentage      = 100
    }
  }
  registry {
    password_secret_name = "reg-pswd-1bc0b56e-9aa0"
    server               = "registry.hub.docker.com"
    username             = var.dockerhub_username
  }
  secret {
    name  = "db-password"
    value = var.db_password
  }
  secret {
    name  = "firebase-auth"
    value = var.firebase_credentials_json
  }
  secret {
    name  = "reg-pswd-1bc0b56e-9aa0"
    value = var.dockerhub_token
  }
  secret {
    name  = "service-bus-connection-string"
    value = var.servicebus_connection_string
  }
  template {
    cooldown_period_in_seconds = 120
    max_replicas               = 1
    min_replicas               = 0
    container {
      cpu    = 0.25
      image  = "${var.image_repository}/senti_notificacion_ms:${var.senti_notificacion_image_tag}"
      memory = "0.5Gi"
      name   = "senti-notificacion-ms"
      env {
        name  = "DB_HOST"
        value = "cbse-sentinel2026.database.windows.net"
      }
      env {
        name  = "DB_PORT"
        value = "1433"
      }
      env {
        name  = "DB_USERNAME"
        value = "cbse-sentinel2026"
      }
      env {
        name  = "DB_ENCRYPT"
        value = "true"
      }
      env {
        name  = "DB_TRUST_SERVER_CERTIFICATE"
        value = "false"
      }
      env {
        name  = "DB_DATABASE"
        value = "senti_notificacion_db"
      }
      env {
        name        = "DB_PASSWORD"
        secret_name = "db-password"
      }
      env {
        name        = "SERVICEBUS_CONNECTION_STRING"
        secret_name = "service-bus-connection-string"
      }
      env {
        name        = "FIREBASE_CREDENTIALS_JSON"
        secret_name = "firebase-auth"
      }
      env {
        name  = "SERVICEBUS_QUEUE_NAME"
        value = "senti-notificaciones"
      }
      liveness_probe {
        initial_delay = 0
        port          = 8000
        timeout       = 5
        transport     = "TCP"
      }
      readiness_probe {
        failure_count_threshold = 48
        interval_seconds        = 5
        port                    = 8000
        success_count_threshold = 1
        timeout                 = 5
        transport               = "TCP"
      }
      startup_probe {
        failure_count_threshold = 240
        initial_delay           = 1
        interval_seconds        = 1
        port                    = 8000
        timeout                 = 3
        transport               = "TCP"
      }
    }
    http_scale_rule {
      concurrent_requests = "10"
      name                = "http-scaler"
    }
  }
}
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
resource "azurerm_eventgrid_topic" "res-44" {
  location            = "eastus"
  name                = "senti-eventos-mq"
  resource_group_name = azurerm_resource_group.res-0.name
}
resource "azurerm_log_analytics_workspace" "res-49" {
  location            = "westus2"
  name                = "workspacergsentinel90ce"
  resource_group_name = azurerm_resource_group.res-0.name
}
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
