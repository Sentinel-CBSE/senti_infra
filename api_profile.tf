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
