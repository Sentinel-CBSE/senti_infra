resource "azurerm_resource_group" "res-0" {
  location = "eastus"
  name     = "rg-sentinel"
}
resource "azurerm_api_management" "res-1" {
  location            = "eastus"
  name                = "sentiapigateway"
  publisher_email     = "david.alfonso.canas@gmail.com"
  publisher_name      = "sentinel"
  resource_group_name = azurerm_resource_group.res-0.name
  sku_name            = "Consumption_0"
}
resource "azurerm_api_management_api" "res-2" {
  api_management_name = "sentiapigateway"
  description         = "Microservicio encargado de la gestion de datos personales, informacion medica basica y contactos de emergencia dentro del sistema SENTI de reporte de robos."
  name                = "senti-datos-personales-ms"
  resource_group_name = azurerm_resource_group.res-0.name
  revision            = "1"
  contact {
  }
  depends_on = [
    azurerm_api_management.res-1,
  ]
}
resource "azurerm_api_management_api_operation" "res-3" {
  api_management_name = "sentiapigateway"
  api_name            = "senti-datos-personales-ms"
  description         = "Obtener un contacto de emergencia por id"
  display_name        = "Obtener un contacto de emergencia por id"
  method              = "GET"
  operation_id        = "ContactosEmergenciaController_findOne"
  resource_group_name = azurerm_resource_group.res-0.name
  url_template        = "/contactos-emergencia/{id}"
  response {
    status_code = 200
  }
  template_parameter {
    name      = "id"
    required  = true
    schema_id = "6aaf553c59b00515809d48e4"
    type      = "string"
    type_name = "Contactos-emergencia-id-GetRequest"
  }
  depends_on = [
    azurerm_api_management_api.res-2,
  ]
}
resource "azurerm_api_management_api_operation_policy" "res-4" {
  api_management_name = "sentiapigateway"
  api_name            = "senti-datos-personales-ms"
  operation_id        = "ContactosEmergenciaController_findOne"
  resource_group_name = azurerm_resource_group.res-0.name
  depends_on = [
    azurerm_api_management_api_operation.res-3,
  ]
}
resource "azurerm_api_management_api_operation_tag" "res-5" {
  api_operation_id = "/subscriptions/246fb3a2-71ca-4779-9858-2e92aef6f9e2/resourceGroups/rg-sentinel/providers/Microsoft.ApiManagement/service/sentiapigateway/apis/senti-datos-personales-ms/operations/ContactosEmergenciaController_findOne"
  display_name     = "contactos-emergencia"
  name             = "contactos-emergencia"
  depends_on = [
    azurerm_api_management_api_operation.res-3,
    # One of azurerm_api_management_api_operation.res-3,azurerm_api_management_api_operation_policy.res-4 (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_api_management_api_operation" "res-6" {
  api_management_name = "sentiapigateway"
  api_name            = "senti-datos-personales-ms"
  description         = "Eliminar un contacto de emergencia"
  display_name        = "Eliminar un contacto de emergencia"
  method              = "DELETE"
  operation_id        = "ContactosEmergenciaController_remove"
  resource_group_name = azurerm_resource_group.res-0.name
  url_template        = "/contactos-emergencia/{id}"
  response {
    status_code = 204
  }
  template_parameter {
    name      = "id"
    required  = true
    schema_id = "6aaf553c59b00515809d48e4"
    type      = "string"
    type_name = "Contactos-emergencia-id-DeleteRequest"
  }
  depends_on = [
    azurerm_api_management_api.res-2,
  ]
}
resource "azurerm_api_management_api_operation_policy" "res-7" {
  api_management_name = "sentiapigateway"
  api_name            = "senti-datos-personales-ms"
  operation_id        = "ContactosEmergenciaController_remove"
  resource_group_name = azurerm_resource_group.res-0.name
  depends_on = [
    azurerm_api_management_api_operation.res-6,
  ]
}
resource "azurerm_api_management_api_operation_tag" "res-8" {
  api_operation_id = "/subscriptions/246fb3a2-71ca-4779-9858-2e92aef6f9e2/resourceGroups/rg-sentinel/providers/Microsoft.ApiManagement/service/sentiapigateway/apis/senti-datos-personales-ms/operations/ContactosEmergenciaController_remove"
  display_name     = "contactos-emergencia"
  name             = "contactos-emergencia"
  depends_on = [
    azurerm_api_management_api_operation.res-6,
    # One of azurerm_api_management_api_operation.res-6,azurerm_api_management_api_operation_policy.res-7 (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_api_management_api_operation" "res-9" {
  api_management_name = "sentiapigateway"
  api_name            = "senti-datos-personales-ms"
  description         = "Editar un contacto de emergencia"
  display_name        = "Editar un contacto de emergencia"
  method              = "PATCH"
  operation_id        = "ContactosEmergenciaController_update"
  resource_group_name = azurerm_resource_group.res-0.name
  url_template        = "/contactos-emergencia/{id}"
  response {
    status_code = 200
  }
  template_parameter {
    name      = "id"
    required  = true
    schema_id = "6aaf553c59b00515809d48e4"
    type      = "string"
    type_name = "Contactos-emergencia-id-PatchRequest"
  }
  depends_on = [
    azurerm_api_management_api.res-2,
  ]
}
resource "azurerm_api_management_api_operation_policy" "res-10" {
  api_management_name = "sentiapigateway"
  api_name            = "senti-datos-personales-ms"
  operation_id        = "ContactosEmergenciaController_update"
  resource_group_name = azurerm_resource_group.res-0.name
  depends_on = [
    azurerm_api_management_api_operation.res-9,
  ]
}
resource "azurerm_api_management_api_operation_tag" "res-11" {
  api_operation_id = "/subscriptions/246fb3a2-71ca-4779-9858-2e92aef6f9e2/resourceGroups/rg-sentinel/providers/Microsoft.ApiManagement/service/sentiapigateway/apis/senti-datos-personales-ms/operations/ContactosEmergenciaController_update"
  display_name     = "contactos-emergencia"
  name             = "contactos-emergencia"
  depends_on = [
    azurerm_api_management_api_operation.res-9,
    # One of azurerm_api_management_api_operation.res-9,azurerm_api_management_api_operation_policy.res-10 (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_api_management_api_operation" "res-12" {
  api_management_name = "sentiapigateway"
  api_name            = "senti-datos-personales-ms"
  description         = "Listar el catalogo de EPS activas"
  display_name        = "Listar el catalogo de EPS activas"
  method              = "GET"
  operation_id        = "EpsController_findAll"
  resource_group_name = azurerm_resource_group.res-0.name
  url_template        = "/eps"
  response {
    status_code = 200
  }
  depends_on = [
    azurerm_api_management_api.res-2,
  ]
}
resource "azurerm_api_management_api_operation_policy" "res-13" {
  api_management_name = "sentiapigateway"
  api_name            = "senti-datos-personales-ms"
  operation_id        = "EpsController_findAll"
  resource_group_name = azurerm_resource_group.res-0.name
  depends_on = [
    azurerm_api_management_api_operation.res-12,
  ]
}
resource "azurerm_api_management_api_operation_tag" "res-14" {
  api_operation_id = "/subscriptions/246fb3a2-71ca-4779-9858-2e92aef6f9e2/resourceGroups/rg-sentinel/providers/Microsoft.ApiManagement/service/sentiapigateway/apis/senti-datos-personales-ms/operations/EpsController_findAll"
  display_name     = "eps"
  name             = "eps"
  depends_on = [
    azurerm_api_management_api_operation.res-12,
    # One of azurerm_api_management_api_operation.res-12,azurerm_api_management_api_operation_policy.res-13 (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_api_management_api_operation" "res-15" {
  api_management_name = "sentiapigateway"
  api_name            = "senti-datos-personales-ms"
  description         = "Obtener una EPS por id"
  display_name        = "Obtener una EPS por id"
  method              = "GET"
  operation_id        = "EpsController_findOne"
  resource_group_name = azurerm_resource_group.res-0.name
  url_template        = "/eps/{id}"
  response {
    status_code = 200
  }
  template_parameter {
    name      = "id"
    required  = true
    schema_id = "6aaf553c59b00515809d48e4"
    type      = "string"
    type_name = "Eps-id-GetRequest"
  }
  depends_on = [
    azurerm_api_management_api.res-2,
  ]
}
resource "azurerm_api_management_api_operation_policy" "res-16" {
  api_management_name = "sentiapigateway"
  api_name            = "senti-datos-personales-ms"
  operation_id        = "EpsController_findOne"
  resource_group_name = azurerm_resource_group.res-0.name
  depends_on = [
    azurerm_api_management_api_operation.res-15,
  ]
}
resource "azurerm_api_management_api_operation_tag" "res-17" {
  api_operation_id = "/subscriptions/246fb3a2-71ca-4779-9858-2e92aef6f9e2/resourceGroups/rg-sentinel/providers/Microsoft.ApiManagement/service/sentiapigateway/apis/senti-datos-personales-ms/operations/EpsController_findOne"
  display_name     = "eps"
  name             = "eps"
  depends_on = [
    azurerm_api_management_api_operation.res-15,
    # One of azurerm_api_management_api_operation.res-15,azurerm_api_management_api_operation_policy.res-16 (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_api_management_api_operation" "res-18" {
  api_management_name = "sentiapigateway"
  api_name            = "senti-datos-personales-ms"
  description         = "Agregar un contacto de emergencia a una persona (disponible en cualquier momento)"
  display_name        = "Agregar un contacto de emergencia a una persona (disponible en cualquier momento)"
  method              = "POST"
  operation_id        = "PersonaContactosEmergenciaController_create"
  resource_group_name = azurerm_resource_group.res-0.name
  url_template        = "/personas/{personaId}/contactos-emergencia"
  response {
    status_code = 201
  }
  template_parameter {
    name      = "personaId"
    required  = true
    schema_id = "6aaf553c59b00515809d48e4"
    type      = "string"
    type_name = "Personas-personaId-Contactos-emergenciaPostRequest"
  }
  depends_on = [
    azurerm_api_management_api.res-2,
  ]
}
resource "azurerm_api_management_api_operation_policy" "res-19" {
  api_management_name = "sentiapigateway"
  api_name            = "senti-datos-personales-ms"
  operation_id        = "PersonaContactosEmergenciaController_create"
  resource_group_name = azurerm_resource_group.res-0.name
  depends_on = [
    azurerm_api_management_api_operation.res-18,
  ]
}
resource "azurerm_api_management_api_operation_tag" "res-20" {
  api_operation_id = "/subscriptions/246fb3a2-71ca-4779-9858-2e92aef6f9e2/resourceGroups/rg-sentinel/providers/Microsoft.ApiManagement/service/sentiapigateway/apis/senti-datos-personales-ms/operations/PersonaContactosEmergenciaController_create"
  display_name     = "contactos-emergencia"
  name             = "contactos-emergencia"
  depends_on = [
    azurerm_api_management_api_operation.res-18,
    # One of azurerm_api_management_api_operation.res-18,azurerm_api_management_api_operation_policy.res-19 (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_api_management_api_operation" "res-21" {
  api_management_name = "sentiapigateway"
  api_name            = "senti-datos-personales-ms"
  description         = "Listar los contactos de emergencia de una persona"
  display_name        = "Listar los contactos de emergencia de una persona"
  method              = "GET"
  operation_id        = "PersonaContactosEmergenciaController_findAll"
  resource_group_name = azurerm_resource_group.res-0.name
  url_template        = "/personas/{personaId}/contactos-emergencia"
  response {
    status_code = 200
  }
  template_parameter {
    name      = "personaId"
    required  = true
    schema_id = "6aaf553c59b00515809d48e4"
    type      = "string"
    type_name = "Personas-personaId-Contactos-emergenciaGetRequest"
  }
  depends_on = [
    azurerm_api_management_api.res-2,
  ]
}
resource "azurerm_api_management_api_operation_policy" "res-22" {
  api_management_name = "sentiapigateway"
  api_name            = "senti-datos-personales-ms"
  operation_id        = "PersonaContactosEmergenciaController_findAll"
  resource_group_name = azurerm_resource_group.res-0.name
  depends_on = [
    azurerm_api_management_api_operation.res-21,
  ]
}
resource "azurerm_api_management_api_operation_tag" "res-23" {
  api_operation_id = "/subscriptions/246fb3a2-71ca-4779-9858-2e92aef6f9e2/resourceGroups/rg-sentinel/providers/Microsoft.ApiManagement/service/sentiapigateway/apis/senti-datos-personales-ms/operations/PersonaContactosEmergenciaController_findAll"
  display_name     = "contactos-emergencia"
  name             = "contactos-emergencia"
  depends_on = [
    azurerm_api_management_api_operation.res-21,
    # One of azurerm_api_management_api_operation.res-21,azurerm_api_management_api_operation_policy.res-22 (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_api_management_api_operation" "res-24" {
  api_management_name = "sentiapigateway"
  api_name            = "senti-datos-personales-ms"
  description         = "Registrar los datos personales de una persona"
  display_name        = "Registrar los datos personales de una persona"
  method              = "POST"
  operation_id        = "PersonasController_create"
  resource_group_name = azurerm_resource_group.res-0.name
  url_template        = "/personas"
  response {
    status_code = 201
  }
  depends_on = [
    azurerm_api_management_api.res-2,
  ]
}
resource "azurerm_api_management_api_operation_policy" "res-25" {
  api_management_name = "sentiapigateway"
  api_name            = "senti-datos-personales-ms"
  operation_id        = "PersonasController_create"
  resource_group_name = azurerm_resource_group.res-0.name
  depends_on = [
    azurerm_api_management_api_operation.res-24,
  ]
}
resource "azurerm_api_management_api_operation_tag" "res-26" {
  api_operation_id = "/subscriptions/246fb3a2-71ca-4779-9858-2e92aef6f9e2/resourceGroups/rg-sentinel/providers/Microsoft.ApiManagement/service/sentiapigateway/apis/senti-datos-personales-ms/operations/PersonasController_create"
  display_name     = "personas"
  name             = "personas"
  depends_on = [
    azurerm_api_management_api_operation.res-24,
    # One of azurerm_api_management_api_operation.res-24,azurerm_api_management_api_operation_policy.res-25 (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_api_management_api_operation" "res-27" {
  api_management_name = "sentiapigateway"
  api_name            = "senti-datos-personales-ms"
  description         = "Desactivar una persona (soft delete: no se elimina el registro para conservar el historial de robos asociado)"
  display_name        = "Desactivar una persona (soft delete: no se elimina el registro para conservar el historial de robos asociado)"
  method              = "DELETE"
  operation_id        = "PersonasController_deactivate"
  resource_group_name = azurerm_resource_group.res-0.name
  url_template        = "/personas/{id}"
  response {
    status_code = 200
  }
  template_parameter {
    name      = "id"
    required  = true
    schema_id = "6aaf553c59b00515809d48e4"
    type      = "string"
    type_name = "Personas-id-DeleteRequest"
  }
  depends_on = [
    azurerm_api_management_api.res-2,
  ]
}
resource "azurerm_api_management_api_operation_policy" "res-28" {
  api_management_name = "sentiapigateway"
  api_name            = "senti-datos-personales-ms"
  operation_id        = "PersonasController_deactivate"
  resource_group_name = azurerm_resource_group.res-0.name
  depends_on = [
    azurerm_api_management_api_operation.res-27,
  ]
}
resource "azurerm_api_management_api_operation_tag" "res-29" {
  api_operation_id = "/subscriptions/246fb3a2-71ca-4779-9858-2e92aef6f9e2/resourceGroups/rg-sentinel/providers/Microsoft.ApiManagement/service/sentiapigateway/apis/senti-datos-personales-ms/operations/PersonasController_deactivate"
  display_name     = "personas"
  name             = "personas"
  depends_on = [
    azurerm_api_management_api_operation.res-27,
    # One of azurerm_api_management_api_operation.res-27,azurerm_api_management_api_operation_policy.res-28 (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_api_management_api_operation" "res-30" {
  api_management_name = "sentiapigateway"
  api_name            = "senti-datos-personales-ms"
  description         = "Listar/buscar personas (uso interno de otros microservicios)"
  display_name        = "Listar/buscar personas (uso interno de otros microservicios)"
  method              = "GET"
  operation_id        = "PersonasController_findAll"
  resource_group_name = azurerm_resource_group.res-0.name
  url_template        = "/personas"
  response {
    status_code = 200
  }
  depends_on = [
    azurerm_api_management_api.res-2,
  ]
}
resource "azurerm_api_management_api_operation_policy" "res-31" {
  api_management_name = "sentiapigateway"
  api_name            = "senti-datos-personales-ms"
  operation_id        = "PersonasController_findAll"
  resource_group_name = azurerm_resource_group.res-0.name
  depends_on = [
    azurerm_api_management_api_operation.res-30,
  ]
}
resource "azurerm_api_management_api_operation_tag" "res-32" {
  api_operation_id = "/subscriptions/246fb3a2-71ca-4779-9858-2e92aef6f9e2/resourceGroups/rg-sentinel/providers/Microsoft.ApiManagement/service/sentiapigateway/apis/senti-datos-personales-ms/operations/PersonasController_findAll"
  display_name     = "personas"
  name             = "personas"
  depends_on = [
    azurerm_api_management_api_operation.res-30,
    # One of azurerm_api_management_api_operation.res-30,azurerm_api_management_api_operation_policy.res-31 (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_api_management_api_operation" "res-33" {
  api_management_name = "sentiapigateway"
  api_name            = "senti-datos-personales-ms"
  description         = "Obtener el detalle completo de una persona"
  display_name        = "Obtener el detalle completo de una persona"
  method              = "GET"
  operation_id        = "PersonasController_findOne"
  resource_group_name = azurerm_resource_group.res-0.name
  url_template        = "/personas/{id}"
  response {
    status_code = 200
  }
  template_parameter {
    name      = "id"
    required  = true
    schema_id = "6aaf553c59b00515809d48e4"
    type      = "string"
    type_name = "Personas-id-GetRequest"
  }
  depends_on = [
    azurerm_api_management_api.res-2,
  ]
}
resource "azurerm_api_management_api_operation_policy" "res-34" {
  api_management_name = "sentiapigateway"
  api_name            = "senti-datos-personales-ms"
  operation_id        = "PersonasController_findOne"
  resource_group_name = azurerm_resource_group.res-0.name
  depends_on = [
    azurerm_api_management_api_operation.res-33,
  ]
}
resource "azurerm_api_management_api_operation_tag" "res-35" {
  api_operation_id = "/subscriptions/246fb3a2-71ca-4779-9858-2e92aef6f9e2/resourceGroups/rg-sentinel/providers/Microsoft.ApiManagement/service/sentiapigateway/apis/senti-datos-personales-ms/operations/PersonasController_findOne"
  display_name     = "personas"
  name             = "personas"
  depends_on = [
    azurerm_api_management_api_operation.res-33,
    # One of azurerm_api_management_api_operation.res-33,azurerm_api_management_api_operation_policy.res-34 (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_api_management_api_operation" "res-36" {
  api_management_name = "sentiapigateway"
  api_name            = "senti-datos-personales-ms"
  description         = "Informacion resumida para el microservicio de reporte de robos: datos basicos + contactos de emergencia a notificar"
  display_name        = "Informacion resumida para el microservicio de reporte de robos: datos basicos + contactos de emergencia a notificar"
  method              = "GET"
  operation_id        = "PersonasController_getInfoParaRobo"
  resource_group_name = azurerm_resource_group.res-0.name
  url_template        = "/personas/{id}/info-robo"
  response {
    status_code = 200
  }
  template_parameter {
    name      = "id"
    required  = true
    schema_id = "6aaf553c59b00515809d48e4"
    type      = "string"
    type_name = "Personas-id-Info-roboGetRequest"
  }
  depends_on = [
    azurerm_api_management_api.res-2,
  ]
}
resource "azurerm_api_management_api_operation_policy" "res-37" {
  api_management_name = "sentiapigateway"
  api_name            = "senti-datos-personales-ms"
  operation_id        = "PersonasController_getInfoParaRobo"
  resource_group_name = azurerm_resource_group.res-0.name
  depends_on = [
    azurerm_api_management_api_operation.res-36,
  ]
}
resource "azurerm_api_management_api_operation_tag" "res-38" {
  api_operation_id = "/subscriptions/246fb3a2-71ca-4779-9858-2e92aef6f9e2/resourceGroups/rg-sentinel/providers/Microsoft.ApiManagement/service/sentiapigateway/apis/senti-datos-personales-ms/operations/PersonasController_getInfoParaRobo"
  display_name     = "personas"
  name             = "personas"
  depends_on = [
    azurerm_api_management_api_operation.res-36,
    # One of azurerm_api_management_api_operation.res-36,azurerm_api_management_api_operation_policy.res-37 (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_api_management_api_operation" "res-39" {
  api_management_name = "sentiapigateway"
  api_name            = "senti-datos-personales-ms"
  description         = "Editar los datos personales de una persona"
  display_name        = "Editar los datos personales de una persona"
  method              = "PATCH"
  operation_id        = "PersonasController_update"
  resource_group_name = azurerm_resource_group.res-0.name
  url_template        = "/personas/{id}"
  response {
    status_code = 200
  }
  template_parameter {
    name      = "id"
    required  = true
    schema_id = "6aaf553c59b00515809d48e4"
    type      = "string"
    type_name = "Personas-id-PatchRequest"
  }
  depends_on = [
    azurerm_api_management_api.res-2,
  ]
}
resource "azurerm_api_management_api_operation_policy" "res-40" {
  api_management_name = "sentiapigateway"
  api_name            = "senti-datos-personales-ms"
  operation_id        = "PersonasController_update"
  resource_group_name = azurerm_resource_group.res-0.name
  depends_on = [
    azurerm_api_management_api_operation.res-39,
  ]
}
resource "azurerm_api_management_api_operation_tag" "res-41" {
  api_operation_id = "/subscriptions/246fb3a2-71ca-4779-9858-2e92aef6f9e2/resourceGroups/rg-sentinel/providers/Microsoft.ApiManagement/service/sentiapigateway/apis/senti-datos-personales-ms/operations/PersonasController_update"
  display_name     = "personas"
  name             = "personas"
  depends_on = [
    azurerm_api_management_api_operation.res-39,
    # One of azurerm_api_management_api_operation.res-39,azurerm_api_management_api_operation_policy.res-40 (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_api_management_api_policy" "res-42" {
  api_management_name = "sentiapigateway"
  api_name            = "senti-datos-personales-ms"
  resource_group_name = azurerm_resource_group.res-0.name
  depends_on = [
    azurerm_api_management_api.res-2,
  ]
}
resource "azurerm_api_management_api_schema" "res-43" {
  api_management_name = "sentiapigateway"
  api_name            = "senti-datos-personales-ms"
  components = jsonencode({
    schemas = {
      Contactos-emergencia-id-DeleteRequest = {
        type          = "string"
        x-apim-inline = true
      }
      Contactos-emergencia-id-GetRequest = {
        type          = "string"
        x-apim-inline = true
      }
      Contactos-emergencia-id-PatchRequest = {
        type          = "string"
        x-apim-inline = true
      }
      CreateContactoEmergenciaDto = {
        properties = {
          nombre = {
            example = "Carlos Gomez"
            type    = "string"
          }
          parentesco = {
            example = "Hermano"
            type    = "string"
          }
          telefono = {
            example = "+573001234567"
            type    = "string"
          }
        }
        required = ["nombre", "telefono", "parentesco"]
        type     = "object"
      }
      CreatePersonaDto = {
        properties = {
          correo = {
            example = "maria.gomez@example.com"
            type    = "string"
          }
          epsId = {
            description = "Id de la EPS registrada en el catalogo (GET /eps)"
            example     = "b3f1a0a0-6e8a-4b1a-9c1a-0f1a2b3c4d5e"
            type        = "string"
          }
          factorRh = {
            enum    = ["+", "-"]
            example = "+"
            type    = "string"
          }
          nombre = {
            example = "Maria Fernanda Gomez"
            type    = "string"
          }
          numeroIdentificacion = {
            example = "1094567890"
            type    = "string"
          }
          tipoIdentificacion = {
            enum    = ["CC", "TI", "CE", "PA", "RC", "PEP"]
            example = "CC"
            type    = "string"
          }
          tipoSangre = {
            enum    = ["A", "B", "AB", "O"]
            example = "O"
            type    = "string"
          }
        }
        required = ["nombre", "correo", "tipoIdentificacion", "numeroIdentificacion", "tipoSangre", "factorRh", "epsId"]
        type     = "object"
      }
      Eps-id-GetRequest = {
        type          = "string"
        x-apim-inline = true
      }
      Personas-id-DeleteRequest = {
        type          = "string"
        x-apim-inline = true
      }
      Personas-id-GetRequest = {
        type          = "string"
        x-apim-inline = true
      }
      Personas-id-Info-roboGetRequest = {
        type          = "string"
        x-apim-inline = true
      }
      Personas-id-PatchRequest = {
        type          = "string"
        x-apim-inline = true
      }
      Personas-personaId-Contactos-emergenciaGetRequest = {
        type          = "string"
        x-apim-inline = true
      }
      Personas-personaId-Contactos-emergenciaPostRequest = {
        type          = "string"
        x-apim-inline = true
      }
      PersonasGetRequest = {
        type          = "string"
        x-apim-inline = true
      }
      PersonasGetRequest-1 = {
        type          = "string"
        x-apim-inline = true
      }
      PersonasGetRequest-2 = {
        default       = true
        type          = "boolean"
        x-apim-inline = true
      }
      PersonasGetRequest-3 = {
        default       = 1
        type          = "number"
        x-apim-inline = true
      }
      PersonasGetRequest-4 = {
        default       = 20
        type          = "number"
        x-apim-inline = true
      }
      UpdateContactoEmergenciaDto = {
        properties = {
          nombre = {
            example = "Carlos Gomez"
            type    = "string"
          }
          parentesco = {
            example = "Hermano"
            type    = "string"
          }
          telefono = {
            example = "+573001234567"
            type    = "string"
          }
        }
        type = "object"
      }
      UpdatePersonaDto = {
        properties = {
          correo = {
            example = "maria.gomez@example.com"
            type    = "string"
          }
          epsId = {
            description = "Id de la EPS registrada en el catalogo (GET /eps)"
            example     = "b3f1a0a0-6e8a-4b1a-9c1a-0f1a2b3c4d5e"
            type        = "string"
          }
          factorRh = {
            enum    = ["+", "-"]
            example = "+"
            type    = "string"
          }
          nombre = {
            example = "Maria Fernanda Gomez"
            type    = "string"
          }
          numeroIdentificacion = {
            example = "1094567890"
            type    = "string"
          }
          tipoIdentificacion = {
            enum    = ["CC", "TI", "CE", "PA", "RC", "PEP"]
            example = "CC"
            type    = "string"
          }
          tipoSangre = {
            enum    = ["A", "B", "AB", "O"]
            example = "O"
            type    = "string"
          }
        }
        type = "object"
      }
    }
  })
  content_type        = "application/vnd.oai.openapi.components+json"
  resource_group_name = azurerm_resource_group.res-0.name
  schema_id           = "6aaf553c59b00515809d48e4"
  depends_on = [
    azurerm_api_management_api.res-2,
  ]
}
resource "azurerm_api_management_api" "res-44" {
  api_management_name = "sentiapigateway"
  name                = "senti-robos-host-v1"
  resource_group_name = azurerm_resource_group.res-0.name
  revision            = "1"
  depends_on = [
    azurerm_api_management.res-1,
  ]
}
resource "azurerm_api_management_api_operation" "res-45" {
  api_management_name = "sentiapigateway"
  api_name            = "senti-robos-host-v1"
  display_name        = "/api/robbery_points - GET"
  method              = "GET"
  operation_id        = "get-api-robbery_points"
  resource_group_name = azurerm_resource_group.res-0.name
  url_template        = "/api/robbery_points"
  response {
    description = "OK"
    status_code = 200
    representation {
      content_type = "text/plain"
      schema_id    = "6aaee11d56773018fc455157"
      type_name    = "ApiRobbery_pointsGet200TextPlainResponse"
      example {
        name = "default"
      }
    }
    representation {
      content_type = "application/json"
      schema_id    = "6aaee11d56773018fc455157"
      type_name    = "ApiRobbery_pointsGet200ApplicationJsonResponse"
      example {
        name = "default"
        value = jsonencode([{
          id        = "string"
          latitude  = {}
          longitude = {}
          timestamp = {}
          type      = "string"
        }])
      }
    }
    representation {
      content_type = "text/json"
      schema_id    = "6aaee11d56773018fc455157"
      type_name    = "ApiRobbery_pointsGet200TextJsonResponse"
      example {
        name = "default"
        value = jsonencode([{
          id        = "string"
          latitude  = {}
          longitude = {}
          timestamp = {}
          type      = "string"
        }])
      }
    }
  }
  depends_on = [
    azurerm_api_management_api.res-44,
  ]
}
resource "azurerm_api_management_api_operation_policy" "res-46" {
  api_management_name = "sentiapigateway"
  api_name            = "senti-robos-host-v1"
  operation_id        = "get-api-robbery_points"
  resource_group_name = azurerm_resource_group.res-0.name
  depends_on = [
    azurerm_api_management_api_operation.res-45,
  ]
}
resource "azurerm_api_management_api_operation_tag" "res-47" {
  api_operation_id = "/subscriptions/246fb3a2-71ca-4779-9858-2e92aef6f9e2/resourceGroups/rg-sentinel/providers/Microsoft.ApiManagement/service/sentiapigateway/apis/senti-robos-host-v1/operations/get-api-robbery_points"
  display_name     = "RobberyPoints"
  name             = "RobberyPoints"
  depends_on = [
    azurerm_api_management_api_operation.res-45,
    # One of azurerm_api_management_api_operation.res-45,azurerm_api_management_api_operation_policy.res-46 (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_api_management_api_operation" "res-48" {
  api_management_name = "sentiapigateway"
  api_name            = "senti-robos-host-v1"
  display_name        = "/Publisher/incidente-reportado - POST"
  method              = "POST"
  operation_id        = "post-publisher-incidente-reportado"
  resource_group_name = azurerm_resource_group.res-0.name
  url_template        = "/Publisher/incidente-reportado"
  response {
    description = "OK"
    status_code = 200
  }
  depends_on = [
    azurerm_api_management_api.res-44,
  ]
}
resource "azurerm_api_management_api_operation_policy" "res-49" {
  api_management_name = "sentiapigateway"
  api_name            = "senti-robos-host-v1"
  operation_id        = "post-publisher-incidente-reportado"
  resource_group_name = azurerm_resource_group.res-0.name
  depends_on = [
    azurerm_api_management_api_operation.res-48,
  ]
}
resource "azurerm_api_management_api_operation_tag" "res-50" {
  api_operation_id = "/subscriptions/246fb3a2-71ca-4779-9858-2e92aef6f9e2/resourceGroups/rg-sentinel/providers/Microsoft.ApiManagement/service/sentiapigateway/apis/senti-robos-host-v1/operations/post-publisher-incidente-reportado"
  display_name     = "Publisher"
  name             = "Publisher"
  depends_on = [
    azurerm_api_management_api_operation.res-48,
    # One of azurerm_api_management_api_operation.res-48,azurerm_api_management_api_operation_policy.res-49 (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_api_management_api_operation" "res-51" {
  api_management_name = "sentiapigateway"
  api_name            = "senti-robos-host-v1"
  display_name        = "/webhooks/incidentes - POST"
  method              = "POST"
  operation_id        = "post-webhooks-incidentes"
  resource_group_name = azurerm_resource_group.res-0.name
  url_template        = "/webhooks/incidentes"
  response {
    description = "OK"
    status_code = 200
  }
  depends_on = [
    azurerm_api_management_api.res-44,
  ]
}
resource "azurerm_api_management_api_operation_policy" "res-52" {
  api_management_name = "sentiapigateway"
  api_name            = "senti-robos-host-v1"
  operation_id        = "post-webhooks-incidentes"
  resource_group_name = azurerm_resource_group.res-0.name
  depends_on = [
    azurerm_api_management_api_operation.res-51,
  ]
}
resource "azurerm_api_management_api_operation_tag" "res-53" {
  api_operation_id = "/subscriptions/246fb3a2-71ca-4779-9858-2e92aef6f9e2/resourceGroups/rg-sentinel/providers/Microsoft.ApiManagement/service/sentiapigateway/apis/senti-robos-host-v1/operations/post-webhooks-incidentes"
  display_name     = "IncidentesWebhook"
  name             = "IncidentesWebhook"
  depends_on = [
    azurerm_api_management_api_operation.res-51,
    # One of azurerm_api_management_api_operation.res-51,azurerm_api_management_api_operation_policy.res-52 (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_api_management_api_policy" "res-54" {
  api_management_name = "sentiapigateway"
  api_name            = "senti-robos-host-v1"
  resource_group_name = azurerm_resource_group.res-0.name
  depends_on = [
    azurerm_api_management_api.res-44,
  ]
}
resource "azurerm_api_management_api_schema" "res-55" {
  api_management_name = "sentiapigateway"
  api_name            = "senti-robos-host-v1"
  components = jsonencode({
    schemas = {
      ApiRobbery_pointsGet200ApplicationJsonResponse = {
        items = {
          "$ref" = "#/components/schemas/RobberyPointDto"
        }
        type          = "array"
        x-apim-inline = true
      }
      ApiRobbery_pointsGet200TextJsonResponse = {
        items = {
          "$ref" = "#/components/schemas/RobberyPointDto"
        }
        type          = "array"
        x-apim-inline = true
      }
      ApiRobbery_pointsGet200TextPlainResponse = {
        items = {
          "$ref" = "#/components/schemas/RobberyPointDto"
        }
        type          = "array"
        x-apim-inline = true
      }
      ApiRobbery_pointsGetRequest = {
        format        = "double"
        pattern       = "^-?(?:0|[1-9]\\d*)(?:\\.\\d+)?(?:[eE][+-]?\\d+)?$"
        x-apim-inline = true
      }
      ApiRobbery_pointsGetRequest-1 = {
        format        = "double"
        pattern       = "^-?(?:0|[1-9]\\d*)(?:\\.\\d+)?(?:[eE][+-]?\\d+)?$"
        x-apim-inline = true
      }
      ApiRobbery_pointsGetRequest-2 = {
        format        = "double"
        pattern       = "^-?(?:0|[1-9]\\d*)(?:\\.\\d+)?(?:[eE][+-]?\\d+)?$"
        x-apim-inline = true
      }
      ApiRobbery_pointsGetRequest-3 = {
        format        = "double"
        pattern       = "^-?(?:0|[1-9]\\d*)(?:\\.\\d+)?(?:[eE][+-]?\\d+)?$"
        x-apim-inline = true
      }
      ApiRobbery_pointsGetRequest-4 = {
        format        = "int64"
        pattern       = "^-?(?:0|[1-9]\\d*)$"
        x-apim-inline = true
      }
      ApiRobbery_pointsGetRequest-5 = {
        format        = "int64"
        pattern       = "^-?(?:0|[1-9]\\d*)$"
        x-apim-inline = true
      }
      ApiRobbery_pointsGetRequest-6 = {
        type          = "string"
        x-apim-inline = true
      }
      IncidenteReportadoTestRequest = {
        properties = {
          latitude = {
            format  = "double"
            pattern = "^-?(?:0|[1-9]\\d*)(?:\\.\\d+)?(?:[eE][+-]?\\d+)?$"
          }
          longitude = {
            format  = "double"
            pattern = "^-?(?:0|[1-9]\\d*)(?:\\.\\d+)?(?:[eE][+-]?\\d+)?$"
          }
          reportingUserId = {
            nullable = true
            type     = "string"
          }
          timestamp = {
            format   = "int64"
            nullable = true
            pattern  = "^-?(?:0|[1-9]\\d*)$"
          }
          type = {
            type = "string"
          }
        }
        required = ["type", "latitude", "longitude", "timestamp", "reportingUserId"]
        type     = "object"
      }
      RobberyPointDto = {
        properties = {
          id = {
            type = "string"
          }
          latitude = {
            format  = "double"
            pattern = "^-?(?:0|[1-9]\\d*)(?:\\.\\d+)?(?:[eE][+-]?\\d+)?$"
          }
          longitude = {
            format  = "double"
            pattern = "^-?(?:0|[1-9]\\d*)(?:\\.\\d+)?(?:[eE][+-]?\\d+)?$"
          }
          timestamp = {
            format   = "int64"
            nullable = true
            pattern  = "^-?(?:0|[1-9]\\d*)$"
          }
          type = {
            nullable = true
            type     = "string"
          }
        }
        required = ["id", "latitude", "longitude", "timestamp", "type"]
        type     = "object"
      }
    }
  })
  content_type        = "application/vnd.oai.openapi.components+json"
  resource_group_name = azurerm_resource_group.res-0.name
  schema_id           = "6aaee11d56773018fc455157"
  depends_on = [
    azurerm_api_management_api.res-44,
  ]
}
resource "azurerm_api_management_api_tag_description" "res-56" {
  api_tag_id = "/subscriptions/246fb3a2-71ca-4779-9858-2e92aef6f9e2/resourceGroups/rg-sentinel/providers/Microsoft.ApiManagement/service/sentiapigateway/apis/senti-robos-host-v1/tags/IncidentesWebhook"
  depends_on = [
    azurerm_api_management_api.res-44,
  ]
}
resource "azurerm_api_management_api_tag_description" "res-57" {
  api_tag_id = "/subscriptions/246fb3a2-71ca-4779-9858-2e92aef6f9e2/resourceGroups/rg-sentinel/providers/Microsoft.ApiManagement/service/sentiapigateway/apis/senti-robos-host-v1/tags/Publisher"
  depends_on = [
    azurerm_api_management_api.res-44,
  ]
}
resource "azurerm_api_management_api_tag_description" "res-58" {
  api_tag_id = "/subscriptions/246fb3a2-71ca-4779-9858-2e92aef6f9e2/resourceGroups/rg-sentinel/providers/Microsoft.ApiManagement/service/sentiapigateway/apis/senti-robos-host-v1/tags/RobberyPoints"
  depends_on = [
    azurerm_api_management_api.res-44,
  ]
}
resource "azurerm_api_management_backend" "res-59" {
  api_management_name = "sentiapigateway"
  description         = "senti-datos-personales"
  name                = "ContainerApp_senti-datos-personales"
  protocol            = "http"
  resource_group_name = azurerm_resource_group.res-0.name
  resource_id         = "https://management.azure.com/subscriptions/246fb3a2-71ca-4779-9858-2e92aef6f9e2/resourceGroups/rg-sentinel/providers/Microsoft.App/containerApps/senti-datos-personales"
  url                 = "https://senti-datos-personales.ashyfield-30fdc462.westus2.azurecontainerapps.io"
  depends_on = [
    azurerm_api_management.res-1,
  ]
}
resource "azurerm_api_management_backend" "res-60" {
  api_management_name = "sentiapigateway"
  description         = "test"
  name                = "ContainerApp_test"
  protocol            = "http"
  resource_group_name = azurerm_resource_group.res-0.name
  resource_id         = "https://management.azure.com/subscriptions/246fb3a2-71ca-4779-9858-2e92aef6f9e2/resourceGroups/rg-sentinel/providers/Microsoft.App/containerApps/test"
  url                 = "http://test.ashyfield-30fdc462.westus2.azurecontainerapps.io"
  depends_on = [
    azurerm_api_management.res-1,
  ]
}
resource "azurerm_api_management_policy" "res-61" {
  api_management_id = azurerm_api_management.res-1.id
  xml_content       = "<!--\r\n    IMPORTANT:\r\n    - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.\r\n    - Only the <forward-request> policy element can appear within the <backend> section element.\r\n    - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.\r\n    - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.\r\n    - To add a policy position the cursor at the desired insertion point and click on the round button associated with the policy.\r\n    - To remove a policy, delete the corresponding policy statement from the policy document.\r\n    - Policies are applied in the order of their appearance, from the top down.\r\n-->\r\n<policies>\r\n\t<inbound></inbound>\r\n\t<backend>\r\n\t\t<forward-request />\r\n\t</backend>\r\n\t<outbound></outbound>\r\n</policies>"
}
resource "azurerm_api_management_tag" "res-63" {
  api_management_id = "/subscriptions/246fb3a2-71ca-4779-9858-2e92aef6f9e2/resourceGroups/rg-sentinel/providers/Microsoft.ApiManagement/service/sentiapigateway"
  name              = "IncidentesWebhook"
  depends_on = [
    azurerm_api_management.res-1,
    # One of azurerm_api_management.res-1,azurerm_api_management_policy.res-61 (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_api_management_tag" "res-65" {
  api_management_id = "/subscriptions/246fb3a2-71ca-4779-9858-2e92aef6f9e2/resourceGroups/rg-sentinel/providers/Microsoft.ApiManagement/service/sentiapigateway"
  name              = "Publisher"
  depends_on = [
    azurerm_api_management.res-1,
    # One of azurerm_api_management.res-1,azurerm_api_management_policy.res-61 (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_api_management_tag" "res-67" {
  api_management_id = "/subscriptions/246fb3a2-71ca-4779-9858-2e92aef6f9e2/resourceGroups/rg-sentinel/providers/Microsoft.ApiManagement/service/sentiapigateway"
  name              = "RobberyPoints"
  depends_on = [
    azurerm_api_management.res-1,
    # One of azurerm_api_management.res-1,azurerm_api_management_policy.res-61 (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_api_management_tag" "res-69" {
  api_management_id = "/subscriptions/246fb3a2-71ca-4779-9858-2e92aef6f9e2/resourceGroups/rg-sentinel/providers/Microsoft.ApiManagement/service/sentiapigateway"
  name              = "Test"
  depends_on = [
    azurerm_api_management.res-1,
    # One of azurerm_api_management.res-1,azurerm_api_management_policy.res-61 (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_api_management_tag" "res-70" {
  api_management_id = "/subscriptions/246fb3a2-71ca-4779-9858-2e92aef6f9e2/resourceGroups/rg-sentinel/providers/Microsoft.ApiManagement/service/sentiapigateway"
  name              = "WeatherForecast"
  depends_on = [
    azurerm_api_management.res-1,
    # One of azurerm_api_management.res-1,azurerm_api_management_policy.res-61 (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_api_management_tag" "res-71" {
  api_management_id = "/subscriptions/246fb3a2-71ca-4779-9858-2e92aef6f9e2/resourceGroups/rg-sentinel/providers/Microsoft.ApiManagement/service/sentiapigateway"
  name              = "contactos-emergencia"
  depends_on = [
    azurerm_api_management.res-1,
    # One of azurerm_api_management.res-1,azurerm_api_management_policy.res-61 (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_api_management_tag" "res-77" {
  api_management_id = "/subscriptions/246fb3a2-71ca-4779-9858-2e92aef6f9e2/resourceGroups/rg-sentinel/providers/Microsoft.ApiManagement/service/sentiapigateway"
  name              = "eps"
  depends_on = [
    azurerm_api_management.res-1,
    # One of azurerm_api_management.res-1,azurerm_api_management_policy.res-61 (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_api_management_tag" "res-80" {
  api_management_id = "/subscriptions/246fb3a2-71ca-4779-9858-2e92aef6f9e2/resourceGroups/rg-sentinel/providers/Microsoft.ApiManagement/service/sentiapigateway"
  name              = "personas"
  depends_on = [
    azurerm_api_management.res-1,
    # One of azurerm_api_management.res-1,azurerm_api_management_policy.res-61 (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_container_app" "res-87" {
  container_app_environment_id = azurerm_container_app_environment.res-89.id
  max_inactive_revisions       = 100
  name                         = "senti-datos-personales"
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
    username             = "dcanasp"
  }
  secret {
    name  = "db-password"
    value = var.db_password
  }
  secret {
    name  = "reg-pswd-1bc0b56e-9aa0"
    value = var.dockerhub_pat
  }
  template {
    cooldown_period_in_seconds = 120
    max_replicas               = 1
    container {
      cpu    = 0.25
      image  = "registry.hub.docker.com/dcanasp/senti_robos:senti_datos"
      memory = "0.5Gi"
      name   = "senti-datos-personales"
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
        value = "sentirobosdb"
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
resource "azurerm_container_app" "res-88" {
  container_app_environment_id = azurerm_container_app_environment.res-89.id
  max_inactive_revisions       = 100
  name                         = "test"
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
    username             = "dcanasp"
  }
  secret {
    name  = "connection-strings-sentirobosdb"
    value = "Server=tcp:cbse-sentinel2026.database.windows.net,1433;Initial Catalog=sentirobosdb;Persist Security Info=False;User ID=cbse-sentinel2026;Password=${var.db_password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
  }
  secret {
    name  = "eventgrid-topic-endpoint"
    value = "https://topic-test-09-14-26.eastus-1.eventgrid.azure.net/api/events"
  }
  secret {
    name  = "eventgrid-topickey"
    value = "D26q8BEFBKkqsHhUG0gGh50FVnPQNzSrvNa0aeuaf0v9cwPMBy1AJQQJ99CIACYeBjFXJ3w3AAABAZEGTIhN"
  }
  secret {
    name  = "reg-pswd-709d69a9-a3cb"
    value = var.dockerhub_pat
  }
  template {
    cooldown_period_in_seconds = 120
    max_replicas               = 1
    container {
      cpu    = 0.25
      image  = "registry.hub.docker.com/dcanasp/senti_robos:9-20"
      memory = "0.5Gi"
      name   = "test"
      env {
        name        = "EventGrid__TopicKey"
        secret_name = "eventgrid-topickey"
      }
      env {
        name        = "EventGrid__TopicEndpoint"
        secret_name = "eventgrid-topic-endpoint"
      }
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
resource "azurerm_container_app_environment" "res-89" {
  location                   = "westus2"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "managedEnvironment-rgsentinel-a121"
  resource_group_name        = azurerm_resource_group.res-0.name
  workload_profile {
    name                  = "Consumption"
    workload_profile_type = "Consumption"
  }
}
resource "azurerm_eventgrid_topic" "res-90" {
  location            = "eastus"
  name                = "topic-test-09-14-26"
  resource_group_name = azurerm_resource_group.res-0.name
  identity {
    type = "SystemAssigned"
  }
}
resource "azurerm_log_analytics_workspace" "res-92" {
  location            = "westus2"
  name                = "workspacergsentinel90ce"
  resource_group_name = azurerm_resource_group.res-0.name
}
resource "azurerm_log_analytics_saved_search" "res-93" {
  category                   = "General Exploration"
  display_name               = "All Computers with their most recent data"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_General|AlphabeticallySortedComputers"
  query                      = "search not(ObjectName == \"Advisor Metrics\" or ObjectName == \"ManagedSpace\") | summarize AggregatedValue = max(TimeGenerated) by Computer | limit 500000 | sort by Computer asc\r\n// Oql: NOT(ObjectName=\"Advisor Metrics\" OR ObjectName=ManagedSpace) | measure max(TimeGenerated) by Computer | top 500000 | Sort Computer // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-94" {
  category                   = "General Exploration"
  display_name               = "Stale Computers (data older than 24 hours)"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_General|StaleComputers"
  query                      = "search not(ObjectName == \"Advisor Metrics\" or ObjectName == \"ManagedSpace\") | summarize lastdata = max(TimeGenerated) by Computer | limit 500000 | where lastdata < ago(24h)\r\n// Oql: NOT(ObjectName=\"Advisor Metrics\" OR ObjectName=ManagedSpace) | measure max(TimeGenerated) as lastdata by Computer | top 500000 | where lastdata < NOW-24HOURS // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-95" {
  category                   = "General Exploration"
  display_name               = "Which Management Group is generating the most data points?"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_General|dataPointsPerManagementGroup"
  query                      = "search * | summarize AggregatedValue = count() by ManagementGroupName\r\n// Oql: * | Measure count() by ManagementGroupName // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-96" {
  category                   = "General Exploration"
  display_name               = "Distribution of data Types"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_General|dataTypeDistribution"
  query                      = "search * | extend Type = $table | summarize AggregatedValue = count() by Type\r\n// Oql: * | Measure count() by Type // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-97" {
  category                   = "Log Management"
  display_name               = "All Events"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_LogManagement|AllEvents"
  query                      = "Event | sort by TimeGenerated desc\r\n// Oql: Type=Event // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-98" {
  category                   = "Log Management"
  display_name               = "All Syslogs"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_LogManagement|AllSyslog"
  query                      = "Syslog | sort by TimeGenerated desc\r\n// Oql: Type=Syslog // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-99" {
  category                   = "Log Management"
  display_name               = "All Syslog Records grouped by Facility"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_LogManagement|AllSyslogByFacility"
  query                      = "Syslog | summarize AggregatedValue = count() by Facility\r\n// Oql: Type=Syslog | Measure count() by Facility // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-100" {
  category                   = "Log Management"
  display_name               = "All Syslog Records grouped by ProcessName"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_LogManagement|AllSyslogByProcessName"
  query                      = "Syslog | summarize AggregatedValue = count() by ProcessName\r\n// Oql: Type=Syslog | Measure count() by ProcessName // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-101" {
  category                   = "Log Management"
  display_name               = "All Syslog Records with Errors"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_LogManagement|AllSyslogsWithErrors"
  query                      = "Syslog | where SeverityLevel == \"error\" | sort by TimeGenerated desc\r\n// Oql: Type=Syslog SeverityLevel=error // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-102" {
  category                   = "Log Management"
  display_name               = "Average HTTP Request time by Client IP Address"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_LogManagement|AverageHTTPRequestTimeByClientIPAddress"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = avg(TimeTaken) by cIP\r\n// Oql: Type=W3CIISLog | Measure Avg(TimeTaken) by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-103" {
  category                   = "Log Management"
  display_name               = "Average HTTP Request time by HTTP Method"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_LogManagement|AverageHTTPRequestTimeHTTPMethod"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = avg(TimeTaken) by csMethod\r\n// Oql: Type=W3CIISLog | Measure Avg(TimeTaken) by csMethod // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-104" {
  category                   = "Log Management"
  display_name               = "Count of IIS Log Entries by Client IP Address"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_LogManagement|CountIISLogEntriesClientIPAddress"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by cIP\r\n// Oql: Type=W3CIISLog | Measure count() by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-105" {
  category                   = "Log Management"
  display_name               = "Count of IIS Log Entries by HTTP Request Method"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_LogManagement|CountIISLogEntriesHTTPRequestMethod"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csMethod\r\n// Oql: Type=W3CIISLog | Measure count() by csMethod // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-106" {
  category                   = "Log Management"
  display_name               = "Count of IIS Log Entries by HTTP User Agent"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_LogManagement|CountIISLogEntriesHTTPUserAgent"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUserAgent\r\n// Oql: Type=W3CIISLog | Measure count() by csUserAgent // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-107" {
  category                   = "Log Management"
  display_name               = "Count of IIS Log Entries by Host requested by client"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_LogManagement|CountOfIISLogEntriesByHostRequestedByClient"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csHost\r\n// Oql: Type=W3CIISLog | Measure count() by csHost // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-108" {
  category                   = "Log Management"
  display_name               = "Count of IIS Log Entries by URL for the host \"www.contoso.com\" (replace with your own)"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_LogManagement|CountOfIISLogEntriesByURLForHost"
  query                      = "search csHost == \"www.contoso.com\" | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUriStem\r\n// Oql: Type=W3CIISLog csHost=\"www.contoso.com\" | Measure count() by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-109" {
  category                   = "Log Management"
  display_name               = "Count of IIS Log Entries by URL requested by client (without query strings)"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_LogManagement|CountOfIISLogEntriesByURLRequestedByClient"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUriStem\r\n// Oql: Type=W3CIISLog | Measure count() by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-110" {
  category                   = "Log Management"
  display_name               = "Count of Events with level \"Warning\" grouped by Event ID"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_LogManagement|CountOfWarningEvents"
  query                      = "Event | where EventLevelName == \"warning\" | summarize AggregatedValue = count() by EventID\r\n// Oql: Type=Event EventLevelName=warning | Measure count() by EventID // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-111" {
  category                   = "Log Management"
  display_name               = "Shows breakdown of response codes"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_LogManagement|DisplayBreakdownRespondCodes"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by scStatus\r\n// Oql: Type=W3CIISLog | Measure count() by scStatus // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-112" {
  category                   = "Log Management"
  display_name               = "Count of Events grouped by Event Log"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_LogManagement|EventsByEventLog"
  query                      = "Event | summarize AggregatedValue = count() by EventLog\r\n// Oql: Type=Event | Measure count() by EventLog // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-113" {
  category                   = "Log Management"
  display_name               = "Count of Events grouped by Event Source"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_LogManagement|EventsByEventSource"
  query                      = "Event | summarize AggregatedValue = count() by Source\r\n// Oql: Type=Event | Measure count() by Source // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-114" {
  category                   = "Log Management"
  display_name               = "Count of Events grouped by Event ID"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_LogManagement|EventsByEventsID"
  query                      = "Event | summarize AggregatedValue = count() by EventID\r\n// Oql: Type=Event | Measure count() by EventID // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-115" {
  category                   = "Log Management"
  display_name               = "Events in the Operations Manager Event Log whose Event ID is in the range between 2000 and 3000"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_LogManagement|EventsInOMBetween2000to3000"
  query                      = "Event | where EventLog == \"Operations Manager\" and EventID >= 2000 and EventID <= 3000 | sort by TimeGenerated desc\r\n// Oql: Type=Event EventLog=\"Operations Manager\" EventID:[2000..3000] // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-116" {
  category                   = "Log Management"
  display_name               = "Count of Events containing the word \"started\" grouped by EventID"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_LogManagement|EventsWithStartedinEventID"
  query                      = "search in (Event) \"started\" | summarize AggregatedValue = count() by EventID\r\n// Oql: Type=Event \"started\" | Measure count() by EventID // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-117" {
  category                   = "Log Management"
  display_name               = "Find the maximum time taken for each page"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_LogManagement|FindMaximumTimeTakenForEachPage"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = max(TimeTaken) by csUriStem\r\n// Oql: Type=W3CIISLog | Measure Max(TimeTaken) by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-118" {
  category                   = "Log Management"
  display_name               = "IIS Log Entries for a specific client IP Address (replace with your own)"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_LogManagement|IISLogEntriesForClientIP"
  query                      = "search cIP == \"192.168.0.1\" | extend Type = $table | where Type == W3CIISLog | sort by TimeGenerated desc | project csUriStem, scBytes, csBytes, TimeTaken, scStatus\r\n// Oql: Type=W3CIISLog cIP=\"192.168.0.1\" | Select csUriStem,scBytes,csBytes,TimeTaken,scStatus // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-119" {
  category                   = "Log Management"
  display_name               = "All IIS Log Entries"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_LogManagement|ListAllIISLogEntries"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | sort by TimeGenerated desc\r\n// Oql: Type=W3CIISLog // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-120" {
  category                   = "Log Management"
  display_name               = "How many connections to Operations Manager's SDK service by day"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_LogManagement|NoOfConnectionsToOMSDKService"
  query                      = "Event | where EventID == 26328 and EventLog == \"Operations Manager\" | summarize AggregatedValue = count() by bin(TimeGenerated, 1d) | sort by TimeGenerated desc\r\n// Oql: Type=Event EventID=26328 EventLog=\"Operations Manager\" | Measure count() interval 1DAY // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-121" {
  category                   = "Log Management"
  display_name               = "When did my servers initiate restart?"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_LogManagement|ServerRestartTime"
  query                      = "search in (Event) \"shutdown\" and EventLog == \"System\" and Source == \"User32\" and EventID == 1074 | sort by TimeGenerated desc | project TimeGenerated, Computer\r\n// Oql: shutdown Type=Event EventLog=System Source=User32 EventID=1074 | Select TimeGenerated,Computer // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-122" {
  category                   = "Log Management"
  display_name               = "Shows which pages people are getting a 404 for"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_LogManagement|Show404PagesList"
  query                      = "search scStatus == 404 | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUriStem\r\n// Oql: Type=W3CIISLog scStatus=404 | Measure count() by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-123" {
  category                   = "Log Management"
  display_name               = "Shows servers that are throwing internal server error"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_LogManagement|ShowServersThrowingInternalServerError"
  query                      = "search scStatus == 500 | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by sComputerName\r\n// Oql: Type=W3CIISLog scStatus=500 | Measure count() by sComputerName // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-124" {
  category                   = "Log Management"
  display_name               = "Total Bytes received by each Azure Role Instance"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_LogManagement|TotalBytesReceivedByEachAzureRoleInstance"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(csBytes) by RoleInstance\r\n// Oql: Type=W3CIISLog | Measure Sum(csBytes) by RoleInstance // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-125" {
  category                   = "Log Management"
  display_name               = "Total Bytes received by each IIS Computer"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_LogManagement|TotalBytesReceivedByEachIISComputer"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(csBytes) by Computer | limit 500000\r\n// Oql: Type=W3CIISLog | Measure Sum(csBytes) by Computer | top 500000 // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-126" {
  category                   = "Log Management"
  display_name               = "Total Bytes responded back to clients by Client IP Address"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_LogManagement|TotalBytesRespondedToClientsByClientIPAddress"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(scBytes) by cIP\r\n// Oql: Type=W3CIISLog | Measure Sum(scBytes) by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-127" {
  category                   = "Log Management"
  display_name               = "Total Bytes responded back to clients by each IIS ServerIP Address"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_LogManagement|TotalBytesRespondedToClientsByEachIISServerIPAddress"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(scBytes) by sIP\r\n// Oql: Type=W3CIISLog | Measure Sum(scBytes) by sIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-128" {
  category                   = "Log Management"
  display_name               = "Total Bytes sent by Client IP Address"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_LogManagement|TotalBytesSentByClientIPAddress"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(csBytes) by cIP\r\n// Oql: Type=W3CIISLog | Measure Sum(csBytes) by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-129" {
  category                   = "Log Management"
  display_name               = "All Events with level \"Warning\""
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_LogManagement|WarningEvents"
  query                      = "Event | where EventLevelName == \"warning\" | sort by TimeGenerated desc\r\n// Oql: Type=Event EventLevelName=warning // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-130" {
  category                   = "Log Management"
  display_name               = "Windows Firewall Policy settings have changed"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_LogManagement|WindowsFireawallPolicySettingsChanged"
  query                      = "Event | where EventLog == \"Microsoft-Windows-Windows Firewall With Advanced Security/Firewall\" and EventID == 2008 | sort by TimeGenerated desc\r\n// Oql: Type=Event EventLog=\"Microsoft-Windows-Windows Firewall With Advanced Security/Firewall\" EventID=2008 // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_saved_search" "res-131" {
  category                   = "Log Management"
  display_name               = "On which machines and how many times have Windows Firewall Policy settings changed"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-92.id
  name                       = "LogManagement(workspacergsentinel90ce)_LogManagement|WindowsFireawallPolicySettingsChangedByMachines"
  query                      = "Event | where EventLog == \"Microsoft-Windows-Windows Firewall With Advanced Security/Firewall\" and EventID == 2008 | summarize AggregatedValue = count() by Computer | limit 500000\r\n// Oql: Type=Event EventLog=\"Microsoft-Windows-Windows Firewall With Advanced Security/Firewall\" EventID=2008 | measure count() by Computer | top 500000 // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-132" {
  display_name = "AACAudit"
  name         = "AACAudit"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-133" {
  display_name = "AACHttpRequest"
  name         = "AACHttpRequest"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-134" {
  display_name = "AADAgentRiskEvents"
  name         = "AADAgentRiskEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-135" {
  display_name = "AADB2CRequestLogs"
  name         = "AADB2CRequestLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-136" {
  display_name = "AADCustomSecurityAttributeAuditLogs"
  name         = "AADCustomSecurityAttributeAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-137" {
  display_name = "AADDomainServicesAccountLogon"
  name         = "AADDomainServicesAccountLogon"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-138" {
  display_name = "AADDomainServicesAccountManagement"
  name         = "AADDomainServicesAccountManagement"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-139" {
  display_name = "AADDomainServicesDNSAuditsDynamicUpdates"
  name         = "AADDomainServicesDNSAuditsDynamicUpdates"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-140" {
  display_name = "AADDomainServicesDNSAuditsGeneral"
  name         = "AADDomainServicesDNSAuditsGeneral"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-141" {
  display_name = "AADDomainServicesDirectoryServiceAccess"
  name         = "AADDomainServicesDirectoryServiceAccess"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-142" {
  display_name = "AADDomainServicesLogonLogoff"
  name         = "AADDomainServicesLogonLogoff"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-143" {
  display_name = "AADDomainServicesPolicyChange"
  name         = "AADDomainServicesPolicyChange"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-144" {
  display_name = "AADDomainServicesPrivilegeUse"
  name         = "AADDomainServicesPrivilegeUse"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-145" {
  display_name = "AADDomainServicesSystemSecurity"
  name         = "AADDomainServicesSystemSecurity"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-146" {
  display_name = "AADFirstPartyToFirstPartySignInLogs"
  name         = "AADFirstPartyToFirstPartySignInLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-147" {
  display_name = "AADGraphActivityLogs"
  name         = "AADGraphActivityLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-148" {
  display_name = "AADManagedIdentitySignInLogs"
  name         = "AADManagedIdentitySignInLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-149" {
  display_name = "AADNonInteractiveUserSignInLogs"
  name         = "AADNonInteractiveUserSignInLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-150" {
  display_name = "AADProvisioningLogs"
  name         = "AADProvisioningLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-151" {
  display_name = "AADRiskyAgents"
  name         = "AADRiskyAgents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-152" {
  display_name = "AADRiskyServicePrincipals"
  name         = "AADRiskyServicePrincipals"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-153" {
  display_name = "AADRiskyUsers"
  name         = "AADRiskyUsers"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-154" {
  display_name = "AADServicePrincipalRiskEvents"
  name         = "AADServicePrincipalRiskEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-155" {
  display_name = "AADServicePrincipalSignInLogs"
  name         = "AADServicePrincipalSignInLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-156" {
  display_name = "AADUserRiskEvents"
  name         = "AADUserRiskEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-157" {
  display_name = "ABSBotRequests"
  name         = "ABSBotRequests"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-158" {
  display_name = "ACICollaborationAudit"
  name         = "ACICollaborationAudit"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-159" {
  display_name = "ACLTransactionLogs"
  name         = "ACLTransactionLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-160" {
  display_name = "ACLUserDefinedLogs"
  name         = "ACLUserDefinedLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-161" {
  display_name = "ACRConnectedClientList"
  name         = "ACRConnectedClientList"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-162" {
  display_name = "ACREntraAuthenticationAuditLog"
  name         = "ACREntraAuthenticationAuditLog"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-163" {
  display_name = "ACSAdvancedMessagingOperations"
  name         = "ACSAdvancedMessagingOperations"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-164" {
  display_name = "ACSAuthIncomingOperations"
  name         = "ACSAuthIncomingOperations"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-165" {
  display_name = "ACSBillingUsage"
  name         = "ACSBillingUsage"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-166" {
  display_name = "ACSCallAutomationIncomingOperations"
  name         = "ACSCallAutomationIncomingOperations"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-167" {
  display_name = "ACSCallAutomationMediaSummary"
  name         = "ACSCallAutomationMediaSummary"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-168" {
  display_name = "ACSCallAutomationStreamingUsage"
  name         = "ACSCallAutomationStreamingUsage"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-169" {
  display_name = "ACSCallClientMediaStatsTimeSeries"
  name         = "ACSCallClientMediaStatsTimeSeries"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-170" {
  display_name = "ACSCallClientOperations"
  name         = "ACSCallClientOperations"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-171" {
  display_name = "ACSCallClientServiceRequestAndOutcome"
  name         = "ACSCallClientServiceRequestAndOutcome"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-172" {
  display_name = "ACSCallClosedCaptionsSummary"
  name         = "ACSCallClosedCaptionsSummary"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-173" {
  display_name = "ACSCallDiagnostics"
  name         = "ACSCallDiagnostics"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-174" {
  display_name = "ACSCallDiagnosticsUpdates"
  name         = "ACSCallDiagnosticsUpdates"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-175" {
  display_name = "ACSCallRecordingIncomingOperations"
  name         = "ACSCallRecordingIncomingOperations"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-176" {
  display_name = "ACSCallRecordingSummary"
  name         = "ACSCallRecordingSummary"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-177" {
  display_name = "ACSCallSummary"
  name         = "ACSCallSummary"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-178" {
  display_name = "ACSCallSummaryUpdates"
  name         = "ACSCallSummaryUpdates"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-179" {
  display_name = "ACSCallSurvey"
  name         = "ACSCallSurvey"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-180" {
  display_name = "ACSCallingMetrics"
  name         = "ACSCallingMetrics"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-181" {
  display_name = "ACSChatIncomingOperations"
  name         = "ACSChatIncomingOperations"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-182" {
  display_name = "ACSEmailSendMailOperational"
  name         = "ACSEmailSendMailOperational"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-183" {
  display_name = "ACSEmailStatusUpdateOperational"
  name         = "ACSEmailStatusUpdateOperational"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-184" {
  display_name = "ACSEmailUserEngagementOperational"
  name         = "ACSEmailUserEngagementOperational"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-185" {
  display_name = "ACSJobRouterIncomingOperations"
  name         = "ACSJobRouterIncomingOperations"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-186" {
  display_name = "ACSOptOutManagementOperations"
  name         = "ACSOptOutManagementOperations"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-187" {
  display_name = "ACSRoomsIncomingOperations"
  name         = "ACSRoomsIncomingOperations"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-188" {
  display_name = "ACSSMSIncomingOperations"
  name         = "ACSSMSIncomingOperations"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-189" {
  display_name = "ADAssessmentRecommendation"
  name         = "ADAssessmentRecommendation"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-190" {
  display_name = "ADFActivityRun"
  name         = "ADFActivityRun"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-191" {
  display_name = "ADFAirflowSchedulerLogs"
  name         = "ADFAirflowSchedulerLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-192" {
  display_name = "ADFAirflowTaskLogs"
  name         = "ADFAirflowTaskLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-193" {
  display_name = "ADFAirflowWebLogs"
  name         = "ADFAirflowWebLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-194" {
  display_name = "ADFAirflowWorkerLogs"
  name         = "ADFAirflowWorkerLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-195" {
  display_name = "ADFPipelineRun"
  name         = "ADFPipelineRun"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-196" {
  display_name = "ADFSSISIntegrationRuntimeLogs"
  name         = "ADFSSISIntegrationRuntimeLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-197" {
  display_name = "ADFSSISPackageEventMessageContext"
  name         = "ADFSSISPackageEventMessageContext"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-198" {
  display_name = "ADFSSISPackageEventMessages"
  name         = "ADFSSISPackageEventMessages"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-199" {
  display_name = "ADFSSISPackageExecutableStatistics"
  name         = "ADFSSISPackageExecutableStatistics"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-200" {
  display_name = "ADFSSISPackageExecutionComponentPhases"
  name         = "ADFSSISPackageExecutionComponentPhases"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-201" {
  display_name = "ADFSSISPackageExecutionDataStatistics"
  name         = "ADFSSISPackageExecutionDataStatistics"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-202" {
  display_name = "ADFSSignInLogs"
  name         = "ADFSSignInLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-203" {
  display_name = "ADFSandboxActivityRun"
  name         = "ADFSandboxActivityRun"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-204" {
  display_name = "ADFSandboxPipelineRun"
  name         = "ADFSandboxPipelineRun"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-205" {
  display_name = "ADFTriggerRun"
  name         = "ADFTriggerRun"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-206" {
  display_name = "ADGSyslogEvent"
  name         = "ADGSyslogEvent"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-207" {
  display_name = "ADReplicationResult"
  name         = "ADReplicationResult"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-208" {
  display_name = "ADSecurityAssessmentRecommendation"
  name         = "ADSecurityAssessmentRecommendation"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-209" {
  display_name = "ADTDataHistoryOperation"
  name         = "ADTDataHistoryOperation"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-210" {
  display_name = "ADTDigitalTwinsOperation"
  name         = "ADTDigitalTwinsOperation"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-211" {
  display_name = "ADTEventRoutesOperation"
  name         = "ADTEventRoutesOperation"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-212" {
  display_name = "ADTModelsOperation"
  name         = "ADTModelsOperation"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-213" {
  display_name = "ADTQueryOperation"
  name         = "ADTQueryOperation"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-214" {
  display_name = "ADXCommand"
  name         = "ADXCommand"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-215" {
  display_name = "ADXDataOperation"
  name         = "ADXDataOperation"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-216" {
  display_name = "ADXIngestionBatching"
  name         = "ADXIngestionBatching"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-217" {
  display_name = "ADXJournal"
  name         = "ADXJournal"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-218" {
  display_name = "ADXQuery"
  name         = "ADXQuery"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-219" {
  display_name = "ADXTableDetails"
  name         = "ADXTableDetails"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-220" {
  display_name = "ADXTableUsageStatistics"
  name         = "ADXTableUsageStatistics"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-221" {
  display_name = "AEWAssignmentBlobLogs"
  name         = "AEWAssignmentBlobLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-222" {
  display_name = "AEWAuditLogs"
  name         = "AEWAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-223" {
  display_name = "AEWComputePipelinesLogs"
  name         = "AEWComputePipelinesLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-224" {
  display_name = "AEWExperimentAssignmentSummary"
  name         = "AEWExperimentAssignmentSummary"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-225" {
  display_name = "AEWExperimentScorecardMetricPairs"
  name         = "AEWExperimentScorecardMetricPairs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-226" {
  display_name = "AEWExperimentScorecards"
  name         = "AEWExperimentScorecards"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-227" {
  display_name = "AFSAuditLogs"
  name         = "AFSAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-228" {
  display_name = "AGCAccessLogs"
  name         = "AGCAccessLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-229" {
  display_name = "AGCFirewallLogs"
  name         = "AGCFirewallLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-230" {
  display_name = "AGSGrafanaAlertAuthFailure"
  name         = "AGSGrafanaAlertAuthFailure"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-231" {
  display_name = "AGSGrafanaLoginEvents"
  name         = "AGSGrafanaLoginEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-232" {
  display_name = "AGSGrafanaUsageInsightsEvents"
  name         = "AGSGrafanaUsageInsightsEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-233" {
  display_name = "AGSUpdateEvents"
  name         = "AGSUpdateEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-234" {
  display_name = "AGWAccessLogs"
  name         = "AGWAccessLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-235" {
  display_name = "AGWFirewallLogs"
  name         = "AGWFirewallLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-236" {
  display_name = "AGWPerformanceLogs"
  name         = "AGWPerformanceLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-237" {
  display_name = "AHCIDiagnosticLogs"
  name         = "AHCIDiagnosticLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-238" {
  display_name = "AHDSDeidAuditLogs"
  name         = "AHDSDeidAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-239" {
  display_name = "AHDSDicomAuditLogs"
  name         = "AHDSDicomAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-240" {
  display_name = "AHDSDicomDiagnosticLogs"
  name         = "AHDSDicomDiagnosticLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-241" {
  display_name = "AHDSMedTechDiagnosticLogs"
  name         = "AHDSMedTechDiagnosticLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-242" {
  display_name = "AKSAudit"
  name         = "AKSAudit"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-243" {
  display_name = "AKSAuditAdmin"
  name         = "AKSAuditAdmin"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-244" {
  display_name = "AKSControlPlane"
  name         = "AKSControlPlane"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-245" {
  display_name = "ALBHealthEvent"
  name         = "ALBHealthEvent"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-246" {
  display_name = "AMAHealth"
  name         = "AMAHealth"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-247" {
  display_name = "AMLManagedNetworkEvent"
  name         = "AMLManagedNetworkEvent"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-248" {
  display_name = "AMSKeyDeliveryRequests"
  name         = "AMSKeyDeliveryRequests"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-249" {
  display_name = "AMSLiveEventOperations"
  name         = "AMSLiveEventOperations"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-250" {
  display_name = "AMSMediaAccountHealth"
  name         = "AMSMediaAccountHealth"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-251" {
  display_name = "AMSStreamingEndpointRequests"
  name         = "AMSStreamingEndpointRequests"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-252" {
  display_name = "AMWMetricsUsageDetails"
  name         = "AMWMetricsUsageDetails"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-253" {
  display_name = "ANFFileAccess"
  name         = "ANFFileAccess"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-254" {
  display_name = "ANFTopClientReadIOPS"
  name         = "ANFTopClientReadIOPS"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-255" {
  display_name = "ANFTopClientWriteIOPS"
  name         = "ANFTopClientWriteIOPS"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-256" {
  display_name = "ANFTopFileReadIOPS"
  name         = "ANFTopFileReadIOPS"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-257" {
  display_name = "ANFTopFileWriteIOPS"
  name         = "ANFTopFileWriteIOPS"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-258" {
  display_name = "AOIDatabaseQuery"
  name         = "AOIDatabaseQuery"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-259" {
  display_name = "AOIDigestion"
  name         = "AOIDigestion"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-260" {
  display_name = "AOIStorage"
  name         = "AOIStorage"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-261" {
  display_name = "APIMDevPortalAuditDiagnosticLog"
  name         = "APIMDevPortalAuditDiagnosticLog"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-262" {
  display_name = "ASCAuditLogs"
  name         = "ASCAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-263" {
  display_name = "ASCDeviceEvents"
  name         = "ASCDeviceEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-264" {
  display_name = "ASRJobs"
  name         = "ASRJobs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-265" {
  display_name = "ASRReplicatedItems"
  name         = "ASRReplicatedItems"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-266" {
  display_name = "ASRv2HealthEvents"
  name         = "ASRv2HealthEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-267" {
  display_name = "ASRv2JobEvents"
  name         = "ASRv2JobEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-268" {
  display_name = "ASRv2ProtectedItems"
  name         = "ASRv2ProtectedItems"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-269" {
  display_name = "ASRv2ReplicationExtensions"
  name         = "ASRv2ReplicationExtensions"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-270" {
  display_name = "ASRv2ReplicationPolicies"
  name         = "ASRv2ReplicationPolicies"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-271" {
  display_name = "ASRv2ReplicationVaults"
  name         = "ASRv2ReplicationVaults"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-272" {
  display_name = "ATCExpressRouteCircuitIpfix"
  name         = "ATCExpressRouteCircuitIpfix"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-273" {
  display_name = "ATCMicrosoftPeeringMetadata"
  name         = "ATCMicrosoftPeeringMetadata"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-274" {
  display_name = "ATCPrivatePeeringMetadata"
  name         = "ATCPrivatePeeringMetadata"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-275" {
  display_name = "AVNMConnectivityConfigurationChange"
  name         = "AVNMConnectivityConfigurationChange"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-276" {
  display_name = "AVNMIPAMPoolAllocationChange"
  name         = "AVNMIPAMPoolAllocationChange"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-277" {
  display_name = "AVNMNetworkGroupMembershipChange"
  name         = "AVNMNetworkGroupMembershipChange"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-278" {
  display_name = "AVNMRuleCollectionChange"
  name         = "AVNMRuleCollectionChange"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-279" {
  display_name = "AVSEsxiFirewallSyslog"
  name         = "AVSEsxiFirewallSyslog"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-280" {
  display_name = "AVSEsxiSyslog"
  name         = "AVSEsxiSyslog"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-281" {
  display_name = "AVSNsxEdgeSyslog"
  name         = "AVSNsxEdgeSyslog"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-282" {
  display_name = "AVSNsxManagerSyslog"
  name         = "AVSNsxManagerSyslog"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-283" {
  display_name = "AVSSyslog"
  name         = "AVSSyslog"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-284" {
  display_name = "AVSVcSyslog"
  name         = "AVSVcSyslog"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-285" {
  display_name = "AZFWApplicationRule"
  name         = "AZFWApplicationRule"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-286" {
  display_name = "AZFWApplicationRuleAggregation"
  name         = "AZFWApplicationRuleAggregation"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-287" {
  display_name = "AZFWDnsFlowTrace"
  name         = "AZFWDnsFlowTrace"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-288" {
  display_name = "AZFWDnsQuery"
  name         = "AZFWDnsQuery"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-289" {
  display_name = "AZFWFatFlow"
  name         = "AZFWFatFlow"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-290" {
  display_name = "AZFWFlowTrace"
  name         = "AZFWFlowTrace"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-291" {
  display_name = "AZFWIdpsSignature"
  name         = "AZFWIdpsSignature"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-292" {
  display_name = "AZFWInternalFqdnResolutionFailure"
  name         = "AZFWInternalFqdnResolutionFailure"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-293" {
  display_name = "AZFWNatRule"
  name         = "AZFWNatRule"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-294" {
  display_name = "AZFWNatRuleAggregation"
  name         = "AZFWNatRuleAggregation"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-295" {
  display_name = "AZFWNetworkRule"
  name         = "AZFWNetworkRule"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-296" {
  display_name = "AZFWNetworkRuleAggregation"
  name         = "AZFWNetworkRuleAggregation"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-297" {
  display_name = "AZFWThreatIntel"
  name         = "AZFWThreatIntel"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-298" {
  display_name = "AZKVAuditLogs"
  name         = "AZKVAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-299" {
  display_name = "AZKVPolicyEvaluationDetailsLogs"
  name         = "AZKVPolicyEvaluationDetailsLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-300" {
  display_name = "AZMSApplicationMetricLogs"
  name         = "AZMSApplicationMetricLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-301" {
  display_name = "AZMSArchiveLogs"
  name         = "AZMSArchiveLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-302" {
  display_name = "AZMSAutoscaleLogs"
  name         = "AZMSAutoscaleLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-303" {
  display_name = "AZMSCustomerManagedKeyUserLogs"
  name         = "AZMSCustomerManagedKeyUserLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-304" {
  display_name = "AZMSDiagnosticErrorLogs"
  name         = "AZMSDiagnosticErrorLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-305" {
  display_name = "AZMSHybridConnectionsEvents"
  name         = "AZMSHybridConnectionsEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-306" {
  display_name = "AZMSKafkaCoordinatorLogs"
  name         = "AZMSKafkaCoordinatorLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-307" {
  display_name = "AZMSKafkaUserErrorLogs"
  name         = "AZMSKafkaUserErrorLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-308" {
  display_name = "AZMSOperationalLogs"
  name         = "AZMSOperationalLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-309" {
  display_name = "AZMSRunTimeAuditLogs"
  name         = "AZMSRunTimeAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-310" {
  display_name = "AZMSVnetConnectionEvents"
  name         = "AZMSVnetConnectionEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-311" {
  display_name = "AddonAzureBackupAlerts"
  name         = "AddonAzureBackupAlerts"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-312" {
  display_name = "AddonAzureBackupJobs"
  name         = "AddonAzureBackupJobs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-313" {
  display_name = "AddonAzureBackupPolicy"
  name         = "AddonAzureBackupPolicy"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-314" {
  display_name = "AddonAzureBackupProtectedInstance"
  name         = "AddonAzureBackupProtectedInstance"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-315" {
  display_name = "AddonAzureBackupStorage"
  name         = "AddonAzureBackupStorage"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-316" {
  display_name = "AegDataPlaneRequests"
  name         = "AegDataPlaneRequests"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-317" {
  display_name = "AegDeliveryFailureLogs"
  name         = "AegDeliveryFailureLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-318" {
  display_name = "AegPublishFailureLogs"
  name         = "AegPublishFailureLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-319" {
  display_name = "AgriFoodApplicationAuditLogs"
  name         = "AgriFoodApplicationAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-320" {
  display_name = "AgriFoodFarmManagementLogs"
  name         = "AgriFoodFarmManagementLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-321" {
  display_name = "AgriFoodFarmOperationLogs"
  name         = "AgriFoodFarmOperationLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-322" {
  display_name = "AgriFoodInsightLogs"
  name         = "AgriFoodInsightLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-323" {
  display_name = "AgriFoodJobProcessedLogs"
  name         = "AgriFoodJobProcessedLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-324" {
  display_name = "AgriFoodModelInferenceLogs"
  name         = "AgriFoodModelInferenceLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-325" {
  display_name = "AgriFoodProviderAuthLogs"
  name         = "AgriFoodProviderAuthLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-326" {
  display_name = "AgriFoodSatelliteLogs"
  name         = "AgriFoodSatelliteLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-327" {
  display_name = "AgriFoodSensorManagementLogs"
  name         = "AgriFoodSensorManagementLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-328" {
  display_name = "AgriFoodWeatherLogs"
  name         = "AgriFoodWeatherLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-329" {
  display_name = "AirflowDagProcessingLogs"
  name         = "AirflowDagProcessingLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-330" {
  display_name = "Alert"
  name         = "Alert"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-331" {
  display_name = "AmlComputeClusterEvent"
  name         = "AmlComputeClusterEvent"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-332" {
  display_name = "AmlComputeClusterNodeEvent"
  name         = "AmlComputeClusterNodeEvent"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-333" {
  display_name = "AmlComputeCpuGpuUtilization"
  name         = "AmlComputeCpuGpuUtilization"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-334" {
  display_name = "AmlComputeInstanceEvent"
  name         = "AmlComputeInstanceEvent"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-335" {
  display_name = "AmlComputeJobEvent"
  name         = "AmlComputeJobEvent"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-336" {
  display_name = "AmlDataLabelEvent"
  name         = "AmlDataLabelEvent"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-337" {
  display_name = "AmlDataSetEvent"
  name         = "AmlDataSetEvent"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-338" {
  display_name = "AmlDataStoreEvent"
  name         = "AmlDataStoreEvent"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-339" {
  display_name = "AmlDeploymentEvent"
  name         = "AmlDeploymentEvent"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-340" {
  display_name = "AmlEnvironmentEvent"
  name         = "AmlEnvironmentEvent"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-341" {
  display_name = "AmlInferencingEvent"
  name         = "AmlInferencingEvent"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-342" {
  display_name = "AmlModelsEvent"
  name         = "AmlModelsEvent"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-343" {
  display_name = "AmlOnlineEndpointConsoleLog"
  name         = "AmlOnlineEndpointConsoleLog"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-344" {
  display_name = "AmlOnlineEndpointEventLog"
  name         = "AmlOnlineEndpointEventLog"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-345" {
  display_name = "AmlOnlineEndpointTrafficLog"
  name         = "AmlOnlineEndpointTrafficLog"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-346" {
  display_name = "AmlPipelineEvent"
  name         = "AmlPipelineEvent"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-347" {
  display_name = "AmlRegistryReadEventsLog"
  name         = "AmlRegistryReadEventsLog"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-348" {
  display_name = "AmlRegistryWriteEventsLog"
  name         = "AmlRegistryWriteEventsLog"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-349" {
  display_name = "AmlRunEvent"
  name         = "AmlRunEvent"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-350" {
  display_name = "AmlRunStatusChangedEvent"
  name         = "AmlRunStatusChangedEvent"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-351" {
  display_name = "ApiManagementGatewayLlmLog"
  name         = "ApiManagementGatewayLlmLog"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-352" {
  display_name = "ApiManagementGatewayLogs"
  name         = "ApiManagementGatewayLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-353" {
  display_name = "ApiManagementGatewayMCPLog"
  name         = "ApiManagementGatewayMCPLog"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-354" {
  display_name = "ApiManagementWebSocketConnectionLogs"
  name         = "ApiManagementWebSocketConnectionLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-355" {
  display_name = "AppAvailabilityResults"
  name         = "AppAvailabilityResults"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-356" {
  display_name = "AppBrowserTimings"
  name         = "AppBrowserTimings"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-357" {
  display_name = "AppCenterError"
  name         = "AppCenterError"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-358" {
  display_name = "AppDependencies"
  name         = "AppDependencies"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-359" {
  display_name = "AppEnvSessionConsoleLogs"
  name         = "AppEnvSessionConsoleLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-360" {
  display_name = "AppEnvSessionLifecycleLogs"
  name         = "AppEnvSessionLifecycleLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-361" {
  display_name = "AppEnvSessionPoolEventLogs"
  name         = "AppEnvSessionPoolEventLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-362" {
  display_name = "AppEnvSpringAppConsoleLogs"
  name         = "AppEnvSpringAppConsoleLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-363" {
  display_name = "AppEvents"
  name         = "AppEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-364" {
  display_name = "AppExceptions"
  name         = "AppExceptions"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-365" {
  display_name = "AppGenAIContent"
  name         = "AppGenAIContent"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-366" {
  display_name = "AppMetrics"
  name         = "AppMetrics"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-367" {
  display_name = "AppPageViews"
  name         = "AppPageViews"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-368" {
  display_name = "AppPerformanceCounters"
  name         = "AppPerformanceCounters"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-369" {
  display_name = "AppPlatformBuildLogs"
  name         = "AppPlatformBuildLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-370" {
  display_name = "AppPlatformContainerEventLogs"
  name         = "AppPlatformContainerEventLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-371" {
  display_name = "AppPlatformIngressLogs"
  name         = "AppPlatformIngressLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-372" {
  display_name = "AppPlatformLogsforSpring"
  name         = "AppPlatformLogsforSpring"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-373" {
  display_name = "AppPlatformSystemLogs"
  name         = "AppPlatformSystemLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-374" {
  display_name = "AppRequests"
  name         = "AppRequests"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-375" {
  display_name = "AppServiceAntivirusScanAuditLogs"
  name         = "AppServiceAntivirusScanAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-376" {
  display_name = "AppServiceAppLogs"
  name         = "AppServiceAppLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-377" {
  display_name = "AppServiceAuditLogs"
  name         = "AppServiceAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-378" {
  display_name = "AppServiceAuthenticationLogs"
  name         = "AppServiceAuthenticationLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-379" {
  display_name = "AppServiceConsoleLogs"
  name         = "AppServiceConsoleLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-380" {
  display_name = "AppServiceEnvironmentPlatformLogs"
  name         = "AppServiceEnvironmentPlatformLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-381" {
  display_name = "AppServiceFileAuditLogs"
  name         = "AppServiceFileAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-382" {
  display_name = "AppServiceHTTPLogs"
  name         = "AppServiceHTTPLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-383" {
  display_name = "AppServiceIPSecAuditLogs"
  name         = "AppServiceIPSecAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-384" {
  display_name = "AppServicePlatformLogs"
  name         = "AppServicePlatformLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-385" {
  display_name = "AppServiceServerlessSecurityPluginData"
  name         = "AppServiceServerlessSecurityPluginData"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-386" {
  display_name = "AppSystemEvents"
  name         = "AppSystemEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-387" {
  display_name = "AppTraces"
  name         = "AppTraces"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-388" {
  display_name = "ArcK8sAudit"
  name         = "ArcK8sAudit"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-389" {
  display_name = "ArcK8sAuditAdmin"
  name         = "ArcK8sAuditAdmin"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-390" {
  display_name = "ArcK8sControlPlane"
  name         = "ArcK8sControlPlane"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-391" {
  display_name = "AuditLogs"
  name         = "AuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-392" {
  display_name = "AutoscaleEvaluationsLog"
  name         = "AutoscaleEvaluationsLog"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-393" {
  display_name = "AutoscaleScaleActionsLog"
  name         = "AutoscaleScaleActionsLog"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-394" {
  display_name = "AzureActivity"
  name         = "AzureActivity"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-395" {
  display_name = "AzureActivityV2"
  name         = "AzureActivityV2"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-396" {
  display_name = "AzureAssessmentRecommendation"
  name         = "AzureAssessmentRecommendation"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-397" {
  display_name = "AzureAttestationDiagnostics"
  name         = "AzureAttestationDiagnostics"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-398" {
  display_name = "AzureBackupOperations"
  name         = "AzureBackupOperations"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-399" {
  display_name = "AzureDevOpsAuditing"
  name         = "AzureDevOpsAuditing"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-400" {
  display_name = "AzureLoadTestingOperation"
  name         = "AzureLoadTestingOperation"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-401" {
  display_name = "AzureMetrics"
  name         = "AzureMetrics"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-402" {
  display_name = "AzureMetricsV2"
  name         = "AzureMetricsV2"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-403" {
  display_name = "AzureMonitorPipelineLogErrors"
  name         = "AzureMonitorPipelineLogErrors"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-404" {
  display_name = "AzureSQLAutomaticTuning"
  name         = "AzureSQLAutomaticTuning"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-405" {
  display_name = "AzureSQLBlocks"
  name         = "AzureSQLBlocks"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-406" {
  display_name = "AzureSQLDatabaseWaitStatistics"
  name         = "AzureSQLDatabaseWaitStatistics"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-407" {
  display_name = "AzureSQLDeadlocks"
  name         = "AzureSQLDeadlocks"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-408" {
  display_name = "AzureSQLErrors"
  name         = "AzureSQLErrors"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-409" {
  display_name = "AzureSQLQueryStoreRuntimeStatistics"
  name         = "AzureSQLQueryStoreRuntimeStatistics"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-410" {
  display_name = "AzureSQLQueryStoreWaitStatistics"
  name         = "AzureSQLQueryStoreWaitStatistics"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-411" {
  display_name = "AzureSQLResourceUsageStats"
  name         = "AzureSQLResourceUsageStats"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-412" {
  display_name = "AzureSQLTimeouts"
  name         = "AzureSQLTimeouts"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-413" {
  display_name = "BehaviorEntities"
  name         = "BehaviorEntities"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-414" {
  display_name = "BehaviorInfo"
  name         = "BehaviorInfo"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-415" {
  display_name = "BlockchainApplicationLog"
  name         = "BlockchainApplicationLog"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-416" {
  display_name = "BlockchainProxyLog"
  name         = "BlockchainProxyLog"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-417" {
  display_name = "CCFApplicationLogs"
  name         = "CCFApplicationLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-418" {
  display_name = "CDBCassandraRequests"
  name         = "CDBCassandraRequests"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-419" {
  display_name = "CDBControlPlaneRequests"
  name         = "CDBControlPlaneRequests"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-420" {
  display_name = "CDBDataPlaneRequests"
  name         = "CDBDataPlaneRequests"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-421" {
  display_name = "CDBDataPlaneRequests15M"
  name         = "CDBDataPlaneRequests15M"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-422" {
  display_name = "CDBDataPlaneRequests5M"
  name         = "CDBDataPlaneRequests5M"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-423" {
  display_name = "CDBGremlinRequests"
  name         = "CDBGremlinRequests"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-424" {
  display_name = "CDBMongoRequests"
  name         = "CDBMongoRequests"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-425" {
  display_name = "CDBPartitionKeyRUConsumption"
  name         = "CDBPartitionKeyRUConsumption"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-426" {
  display_name = "CDBPartitionKeyStatistics"
  name         = "CDBPartitionKeyStatistics"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-427" {
  display_name = "CDBQueryRuntimeStatistics"
  name         = "CDBQueryRuntimeStatistics"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-428" {
  display_name = "CDBTableApiRequests"
  name         = "CDBTableApiRequests"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-429" {
  display_name = "CHSMServiceOperationAuditLogs"
  name         = "CHSMServiceOperationAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-430" {
  display_name = "CIEventsAudit"
  name         = "CIEventsAudit"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-431" {
  display_name = "CIEventsOperational"
  name         = "CIEventsOperational"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-432" {
  display_name = "CassandraAudit"
  name         = "CassandraAudit"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-433" {
  display_name = "CassandraLogs"
  name         = "CassandraLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-434" {
  display_name = "ChaosStudioExperimentEventLogs"
  name         = "ChaosStudioExperimentEventLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-435" {
  display_name = "CloudHsmHardwareOperationAuditLogs"
  name         = "CloudHsmHardwareOperationAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-436" {
  display_name = "CloudHsmServiceOperationAuditLogs"
  name         = "CloudHsmServiceOperationAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-437" {
  display_name = "ComputerGroup"
  name         = "ComputerGroup"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-438" {
  display_name = "ContainerAppConsoleLogs"
  name         = "ContainerAppConsoleLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-439" {
  display_name = "ContainerAppConsoleLogs_CL"
  name         = "ContainerAppConsoleLogs_CL"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
  column {
    display_name = "_timestamp_d"
    name         = "_timestamp_d"
    type         = "real"
  }
  column {
    display_name = "ContainerName_s"
    name         = "ContainerName_s"
    type         = "string"
  }
  column {
    display_name = "Log_s"
    name         = "Log_s"
    type         = "string"
  }
  column {
    display_name = "ContainerImage_s"
    name         = "ContainerImage_s"
    type         = "string"
  }
  column {
    display_name = "EnvironmentName_s"
    name         = "EnvironmentName_s"
    type         = "string"
  }
  column {
    display_name = "RevisionName_s"
    name         = "RevisionName_s"
    type         = "string"
  }
  column {
    display_name = "ContainerGroupId_g"
    name         = "ContainerGroupId_g"
    type         = "guid"
  }
  column {
    display_name = "ContainerGroupName_s"
    name         = "ContainerGroupName_s"
    type         = "string"
  }
  column {
    display_name = "time_t"
    name         = "time_t"
    type         = "dateTime"
  }
  column {
    display_name = "Stream_s"
    name         = "Stream_s"
    type         = "string"
  }
  column {
    display_name = "ContainerAppName_s"
    name         = "ContainerAppName_s"
    type         = "string"
  }
  column {
    display_name = "ContainerId_g"
    name         = "ContainerId_g"
    type         = "guid"
  }
  column {
    display_name = "Category"
    name         = "Category"
    type         = "string"
  }
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-440" {
  display_name = "ContainerAppHTTPLogs"
  name         = "ContainerAppHTTPLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-441" {
  display_name = "ContainerAppSystemLogs"
  name         = "ContainerAppSystemLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-442" {
  display_name = "ContainerAppSystemLogs_CL"
  name         = "ContainerAppSystemLogs_CL"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
  column {
    display_name = "CappsEventKind_s"
    name         = "CappsEventKind_s"
    type         = "string"
  }
  column {
    display_name = "time_t"
    name         = "time_t"
    type         = "dateTime"
  }
  column {
    display_name = "_timestamp_d"
    name         = "_timestamp_d"
    type         = "real"
  }
  column {
    display_name = "EnvironmentName_s"
    name         = "EnvironmentName_s"
    type         = "string"
  }
  column {
    display_name = "time_s"
    name         = "time_s"
    type         = "string"
  }
  column {
    display_name = "ContainerAppName_s"
    name         = "ContainerAppName_s"
    type         = "string"
  }
  column {
    display_name = "Level"
    name         = "Level"
    type         = "string"
  }
  column {
    display_name = "EventSource_s"
    name         = "EventSource_s"
    type         = "string"
  }
  column {
    display_name = "Log_s"
    name         = "Log_s"
    type         = "string"
  }
  column {
    display_name = "TimeStamp_s"
    name         = "TimeStamp_s"
    type         = "string"
  }
  column {
    display_name = "Type_s"
    name         = "Type_s"
    type         = "string"
  }
  column {
    display_name = "JobName_s"
    name         = "JobName_s"
    type         = "string"
  }
  column {
    display_name = "ExecutionName_s"
    name         = "ExecutionName_s"
    type         = "string"
  }
  column {
    display_name = "Reason_s"
    name         = "Reason_s"
    type         = "string"
  }
  column {
    display_name = "Count_d"
    name         = "Count_d"
    type         = "real"
  }
  column {
    display_name = "ReplicaName_s"
    name         = "ReplicaName_s"
    type         = "string"
  }
  column {
    display_name = "RevisionName_s"
    name         = "RevisionName_s"
    type         = "string"
  }
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-443" {
  display_name = "ContainerEvent"
  name         = "ContainerEvent"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-444" {
  display_name = "ContainerImageInventory"
  name         = "ContainerImageInventory"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-445" {
  display_name = "ContainerInstanceLog"
  name         = "ContainerInstanceLog"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-446" {
  display_name = "ContainerInventory"
  name         = "ContainerInventory"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-447" {
  display_name = "ContainerLog"
  name         = "ContainerLog"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-448" {
  display_name = "ContainerLogV2"
  name         = "ContainerLogV2"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-449" {
  display_name = "ContainerNetworkLogs"
  name         = "ContainerNetworkLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-450" {
  display_name = "ContainerNodeInventory"
  name         = "ContainerNodeInventory"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-451" {
  display_name = "ContainerRegistryLoginEvents"
  name         = "ContainerRegistryLoginEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-452" {
  display_name = "ContainerRegistryRepositoryEvents"
  name         = "ContainerRegistryRepositoryEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-453" {
  display_name = "ContainerServiceLog"
  name         = "ContainerServiceLog"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-454" {
  display_name = "CoreAzureBackup"
  name         = "CoreAzureBackup"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-455" {
  display_name = "DCRLogErrors"
  name         = "DCRLogErrors"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-456" {
  display_name = "DCRLogTroubleshooting"
  name         = "DCRLogTroubleshooting"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-457" {
  display_name = "DNSQueryLogs"
  name         = "DNSQueryLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-458" {
  display_name = "DSMAzureBlobStorageLogs"
  name         = "DSMAzureBlobStorageLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-459" {
  display_name = "DSMDataClassificationLogs"
  name         = "DSMDataClassificationLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-460" {
  display_name = "DSMDataLabelingLogs"
  name         = "DSMDataLabelingLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-461" {
  display_name = "DataSetOutput"
  name         = "DataSetOutput"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-462" {
  display_name = "DataSetRuns"
  name         = "DataSetRuns"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-463" {
  display_name = "DataTransferOperations"
  name         = "DataTransferOperations"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-464" {
  display_name = "DatabricksAccounts"
  name         = "DatabricksAccounts"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-465" {
  display_name = "DatabricksApps"
  name         = "DatabricksApps"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-466" {
  display_name = "DatabricksBrickStoreHttpGateway"
  name         = "DatabricksBrickStoreHttpGateway"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-467" {
  display_name = "DatabricksBudgetPolicyCentral"
  name         = "DatabricksBudgetPolicyCentral"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-468" {
  display_name = "DatabricksCapsule8Dataplane"
  name         = "DatabricksCapsule8Dataplane"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-469" {
  display_name = "DatabricksClamAVScan"
  name         = "DatabricksClamAVScan"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-470" {
  display_name = "DatabricksCloudStorageMetadata"
  name         = "DatabricksCloudStorageMetadata"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-471" {
  display_name = "DatabricksClusterLibraries"
  name         = "DatabricksClusterLibraries"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-472" {
  display_name = "DatabricksClusterPolicies"
  name         = "DatabricksClusterPolicies"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-473" {
  display_name = "DatabricksClusters"
  name         = "DatabricksClusters"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-474" {
  display_name = "DatabricksDBFS"
  name         = "DatabricksDBFS"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-475" {
  display_name = "DatabricksDashboards"
  name         = "DatabricksDashboards"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-476" {
  display_name = "DatabricksDataMonitoring"
  name         = "DatabricksDataMonitoring"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-477" {
  display_name = "DatabricksDataRooms"
  name         = "DatabricksDataRooms"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-478" {
  display_name = "DatabricksDatabricksSQL"
  name         = "DatabricksDatabricksSQL"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-479" {
  display_name = "DatabricksDeltaPipelines"
  name         = "DatabricksDeltaPipelines"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-480" {
  display_name = "DatabricksFeatureStore"
  name         = "DatabricksFeatureStore"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-481" {
  display_name = "DatabricksFiles"
  name         = "DatabricksFiles"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-482" {
  display_name = "DatabricksFilesystem"
  name         = "DatabricksFilesystem"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-483" {
  display_name = "DatabricksGenie"
  name         = "DatabricksGenie"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-484" {
  display_name = "DatabricksGitCredentials"
  name         = "DatabricksGitCredentials"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-485" {
  display_name = "DatabricksGlobalInitScripts"
  name         = "DatabricksGlobalInitScripts"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-486" {
  display_name = "DatabricksGroups"
  name         = "DatabricksGroups"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-487" {
  display_name = "DatabricksIAMRole"
  name         = "DatabricksIAMRole"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-488" {
  display_name = "DatabricksIngestion"
  name         = "DatabricksIngestion"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-489" {
  display_name = "DatabricksInstancePools"
  name         = "DatabricksInstancePools"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-490" {
  display_name = "DatabricksJobs"
  name         = "DatabricksJobs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-491" {
  display_name = "DatabricksLakeviewConfig"
  name         = "DatabricksLakeviewConfig"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-492" {
  display_name = "DatabricksLineageTracking"
  name         = "DatabricksLineageTracking"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-493" {
  display_name = "DatabricksMLflowAcledArtifact"
  name         = "DatabricksMLflowAcledArtifact"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-494" {
  display_name = "DatabricksMLflowExperiment"
  name         = "DatabricksMLflowExperiment"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-495" {
  display_name = "DatabricksMarketplaceConsumer"
  name         = "DatabricksMarketplaceConsumer"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-496" {
  display_name = "DatabricksMarketplaceProvider"
  name         = "DatabricksMarketplaceProvider"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-497" {
  display_name = "DatabricksModelRegistry"
  name         = "DatabricksModelRegistry"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-498" {
  display_name = "DatabricksNotebook"
  name         = "DatabricksNotebook"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-499" {
  display_name = "DatabricksOnlineTables"
  name         = "DatabricksOnlineTables"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-500" {
  display_name = "DatabricksPartnerHub"
  name         = "DatabricksPartnerHub"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-501" {
  display_name = "DatabricksPredictiveOptimization"
  name         = "DatabricksPredictiveOptimization"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-502" {
  display_name = "DatabricksRBAC"
  name         = "DatabricksRBAC"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-503" {
  display_name = "DatabricksRFA"
  name         = "DatabricksRFA"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-504" {
  display_name = "DatabricksRemoteHistoryService"
  name         = "DatabricksRemoteHistoryService"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-505" {
  display_name = "DatabricksRepos"
  name         = "DatabricksRepos"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-506" {
  display_name = "DatabricksSQL"
  name         = "DatabricksSQL"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-507" {
  display_name = "DatabricksSQLPermissions"
  name         = "DatabricksSQLPermissions"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-508" {
  display_name = "DatabricksSSH"
  name         = "DatabricksSSH"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-509" {
  display_name = "DatabricksSecrets"
  name         = "DatabricksSecrets"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-510" {
  display_name = "DatabricksServerlessRealTimeInference"
  name         = "DatabricksServerlessRealTimeInference"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-511" {
  display_name = "DatabricksTables"
  name         = "DatabricksTables"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-512" {
  display_name = "DatabricksUnityCatalog"
  name         = "DatabricksUnityCatalog"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-513" {
  display_name = "DatabricksVectorSearch"
  name         = "DatabricksVectorSearch"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-514" {
  display_name = "DatabricksWebTerminal"
  name         = "DatabricksWebTerminal"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-515" {
  display_name = "DatabricksWebhookNotifications"
  name         = "DatabricksWebhookNotifications"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-516" {
  display_name = "DatabricksWorkspace"
  name         = "DatabricksWorkspace"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-517" {
  display_name = "DatabricksWorkspaceFiles"
  name         = "DatabricksWorkspaceFiles"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-518" {
  display_name = "DevCenterAgentHealthLogs"
  name         = "DevCenterAgentHealthLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-519" {
  display_name = "DevCenterBillingEventLogs"
  name         = "DevCenterBillingEventLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-520" {
  display_name = "DevCenterConnectionLogs"
  name         = "DevCenterConnectionLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-521" {
  display_name = "DevCenterDiagnosticLogs"
  name         = "DevCenterDiagnosticLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-522" {
  display_name = "DevCenterResourceOperationLogs"
  name         = "DevCenterResourceOperationLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-523" {
  display_name = "DevOpsOperationsAudit"
  name         = "DevOpsOperationsAudit"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-524" {
  display_name = "DeviceBehaviorEntities"
  name         = "DeviceBehaviorEntities"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-525" {
  display_name = "DeviceBehaviorInfo"
  name         = "DeviceBehaviorInfo"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-526" {
  display_name = "DeviceCustomFileEvents"
  name         = "DeviceCustomFileEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-527" {
  display_name = "DeviceCustomImageLoadEvents"
  name         = "DeviceCustomImageLoadEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-528" {
  display_name = "DeviceCustomNetworkEvents"
  name         = "DeviceCustomNetworkEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-529" {
  display_name = "DeviceCustomProcessEvents"
  name         = "DeviceCustomProcessEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-530" {
  display_name = "DeviceCustomRegistryEvents"
  name         = "DeviceCustomRegistryEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-531" {
  display_name = "DeviceCustomScriptEvents"
  name         = "DeviceCustomScriptEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-532" {
  display_name = "DiscoveryBookshelfAuditLogs"
  name         = "DiscoveryBookshelfAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-533" {
  display_name = "DiscoverySupercomputerAuditLogs"
  name         = "DiscoverySupercomputerAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-534" {
  display_name = "DiscoveryWorkspaceAuditLogs"
  name         = "DiscoveryWorkspaceAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-535" {
  display_name = "DragonCopilot"
  name         = "DragonCopilot"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-536" {
  display_name = "DurableTaskSchedulerLogs"
  name         = "DurableTaskSchedulerLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-537" {
  display_name = "EGNFailedHttpDataPlaneOperations"
  name         = "EGNFailedHttpDataPlaneOperations"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-538" {
  display_name = "EGNFailedMqttConnections"
  name         = "EGNFailedMqttConnections"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-539" {
  display_name = "EGNFailedMqttPublishedMessages"
  name         = "EGNFailedMqttPublishedMessages"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-540" {
  display_name = "EGNFailedMqttSubscriptions"
  name         = "EGNFailedMqttSubscriptions"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-541" {
  display_name = "EGNMqttDisconnections"
  name         = "EGNMqttDisconnections"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-542" {
  display_name = "EGNSuccessfulHttpDataPlaneOperations"
  name         = "EGNSuccessfulHttpDataPlaneOperations"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-543" {
  display_name = "EGNSuccessfulMqttConnections"
  name         = "EGNSuccessfulMqttConnections"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-544" {
  display_name = "ETWEvent"
  name         = "ETWEvent"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-545" {
  display_name = "EdgeActionConsoleLog"
  name         = "EdgeActionConsoleLog"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-546" {
  display_name = "EdgeActionServiceLog"
  name         = "EdgeActionServiceLog"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-547" {
  display_name = "EnrichedMicrosoft365AuditLogs"
  name         = "EnrichedMicrosoft365AuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-548" {
  display_name = "Event"
  name         = "Event"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-549" {
  display_name = "ExchangeAssessmentRecommendation"
  name         = "ExchangeAssessmentRecommendation"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-550" {
  display_name = "ExchangeOnlineAssessmentRecommendation"
  name         = "ExchangeOnlineAssessmentRecommendation"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-551" {
  display_name = "FailedIngestion"
  name         = "FailedIngestion"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-552" {
  display_name = "FunctionAppLogs"
  name         = "FunctionAppLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-553" {
  display_name = "GraphNotificationsActivityLogs"
  name         = "GraphNotificationsActivityLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-554" {
  display_name = "HDInsightAmbariClusterAlerts"
  name         = "HDInsightAmbariClusterAlerts"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-555" {
  display_name = "HDInsightAmbariSystemMetrics"
  name         = "HDInsightAmbariSystemMetrics"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-556" {
  display_name = "HDInsightGatewayAuditLogs"
  name         = "HDInsightGatewayAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-557" {
  display_name = "HDInsightHBaseLogs"
  name         = "HDInsightHBaseLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-558" {
  display_name = "HDInsightHBaseMetrics"
  name         = "HDInsightHBaseMetrics"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-559" {
  display_name = "HDInsightHadoopAndYarnLogs"
  name         = "HDInsightHadoopAndYarnLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-560" {
  display_name = "HDInsightHadoopAndYarnMetrics"
  name         = "HDInsightHadoopAndYarnMetrics"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-561" {
  display_name = "HDInsightHiveAndLLAPLogs"
  name         = "HDInsightHiveAndLLAPLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-562" {
  display_name = "HDInsightHiveAndLLAPMetrics"
  name         = "HDInsightHiveAndLLAPMetrics"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-563" {
  display_name = "HDInsightHiveQueryAppStats"
  name         = "HDInsightHiveQueryAppStats"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-564" {
  display_name = "HDInsightHiveTezAppStats"
  name         = "HDInsightHiveTezAppStats"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-565" {
  display_name = "HDInsightJupyterNotebookEvents"
  name         = "HDInsightJupyterNotebookEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-566" {
  display_name = "HDInsightKafkaLogs"
  name         = "HDInsightKafkaLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-567" {
  display_name = "HDInsightKafkaMetrics"
  name         = "HDInsightKafkaMetrics"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-568" {
  display_name = "HDInsightKafkaServerLog"
  name         = "HDInsightKafkaServerLog"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-569" {
  display_name = "HDInsightOozieLogs"
  name         = "HDInsightOozieLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-570" {
  display_name = "HDInsightRangerAuditLogs"
  name         = "HDInsightRangerAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-571" {
  display_name = "HDInsightSecurityLogs"
  name         = "HDInsightSecurityLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-572" {
  display_name = "HDInsightSparkApplicationEvents"
  name         = "HDInsightSparkApplicationEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-573" {
  display_name = "HDInsightSparkBlockManagerEvents"
  name         = "HDInsightSparkBlockManagerEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-574" {
  display_name = "HDInsightSparkEnvironmentEvents"
  name         = "HDInsightSparkEnvironmentEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-575" {
  display_name = "HDInsightSparkExecutorEvents"
  name         = "HDInsightSparkExecutorEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-576" {
  display_name = "HDInsightSparkExtraEvents"
  name         = "HDInsightSparkExtraEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-577" {
  display_name = "HDInsightSparkJobEvents"
  name         = "HDInsightSparkJobEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-578" {
  display_name = "HDInsightSparkLogs"
  name         = "HDInsightSparkLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-579" {
  display_name = "HDInsightSparkSQLExecutionEvents"
  name         = "HDInsightSparkSQLExecutionEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-580" {
  display_name = "HDInsightSparkStageEvents"
  name         = "HDInsightSparkStageEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-581" {
  display_name = "HDInsightSparkStageTaskAccumulables"
  name         = "HDInsightSparkStageTaskAccumulables"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-582" {
  display_name = "HDInsightSparkTaskEvents"
  name         = "HDInsightSparkTaskEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-583" {
  display_name = "HDInsightStormLogs"
  name         = "HDInsightStormLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-584" {
  display_name = "HDInsightStormMetrics"
  name         = "HDInsightStormMetrics"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-585" {
  display_name = "HDInsightStormTopologyMetrics"
  name         = "HDInsightStormTopologyMetrics"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-586" {
  display_name = "HealthStateChangeEvent"
  name         = "HealthStateChangeEvent"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-587" {
  display_name = "Heartbeat"
  name         = "Heartbeat"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-588" {
  display_name = "InsightsMetrics"
  name         = "InsightsMetrics"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-589" {
  display_name = "IntuneAuditLogs"
  name         = "IntuneAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-590" {
  display_name = "IntuneDeviceComplianceOrg"
  name         = "IntuneDeviceComplianceOrg"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-591" {
  display_name = "IntuneDevices"
  name         = "IntuneDevices"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-592" {
  display_name = "IntuneOperationalLogs"
  name         = "IntuneOperationalLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-593" {
  display_name = "KubeEvents"
  name         = "KubeEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-594" {
  display_name = "KubeHealth"
  name         = "KubeHealth"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-595" {
  display_name = "KubeMonAgentEvents"
  name         = "KubeMonAgentEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-596" {
  display_name = "KubeNodeInventory"
  name         = "KubeNodeInventory"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-597" {
  display_name = "KubePVInventory"
  name         = "KubePVInventory"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-598" {
  display_name = "KubePodInventory"
  name         = "KubePodInventory"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-599" {
  display_name = "KubeServices"
  name         = "KubeServices"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-600" {
  display_name = "LAJobLogs"
  name         = "LAJobLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-601" {
  display_name = "LAQueryLogs"
  name         = "LAQueryLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-602" {
  display_name = "LASummaryLogs"
  name         = "LASummaryLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-603" {
  display_name = "LIATrackingEvents"
  name         = "LIATrackingEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-604" {
  display_name = "LedgerTransactionLogs"
  name         = "LedgerTransactionLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-605" {
  display_name = "LedgerUserDefinedLogs"
  name         = "LedgerUserDefinedLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-606" {
  display_name = "LogicAppWorkflowRuntime"
  name         = "LogicAppWorkflowRuntime"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-607" {
  display_name = "MCCEventLogs"
  name         = "MCCEventLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-608" {
  display_name = "MCVPAuditLogs"
  name         = "MCVPAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-609" {
  display_name = "MCVPOperationLogs"
  name         = "MCVPOperationLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-610" {
  display_name = "MDCDetectionDNSEvents"
  name         = "MDCDetectionDNSEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-611" {
  display_name = "MDCDetectionFimEvents"
  name         = "MDCDetectionFimEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-612" {
  display_name = "MDCDetectionGatingValidationEvents"
  name         = "MDCDetectionGatingValidationEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-613" {
  display_name = "MDCDetectionK8SApiEvents"
  name         = "MDCDetectionK8SApiEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-614" {
  display_name = "MDCDetectionProcessV2Events"
  name         = "MDCDetectionProcessV2Events"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-615" {
  display_name = "MDCFileIntegrityMonitoringEvents"
  name         = "MDCFileIntegrityMonitoringEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-616" {
  display_name = "MDECustomCollectionDeviceFileEvents"
  name         = "MDECustomCollectionDeviceFileEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-617" {
  display_name = "MDPResourceLog"
  name         = "MDPResourceLog"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-618" {
  display_name = "MNFDeviceUpdates"
  name         = "MNFDeviceUpdates"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-619" {
  display_name = "MNFSystemSessionHistoryUpdates"
  name         = "MNFSystemSessionHistoryUpdates"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-620" {
  display_name = "MNFSystemStateMessageUpdates"
  name         = "MNFSystemStateMessageUpdates"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-621" {
  display_name = "MPCAuditLogs"
  name         = "MPCAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-622" {
  display_name = "MPCIngestionLogs"
  name         = "MPCIngestionLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-623" {
  display_name = "MeshControlPlane"
  name         = "MeshControlPlane"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-624" {
  display_name = "MicrosoftAzureBastionAuditLogs"
  name         = "MicrosoftAzureBastionAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-625" {
  display_name = "MicrosoftDataShareReceivedSnapshotLog"
  name         = "MicrosoftDataShareReceivedSnapshotLog"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-626" {
  display_name = "MicrosoftDataShareSentSnapshotLog"
  name         = "MicrosoftDataShareSentSnapshotLog"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-627" {
  display_name = "MicrosoftDataShareShareLog"
  name         = "MicrosoftDataShareShareLog"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-628" {
  display_name = "MicrosoftGraphActivityLogs"
  name         = "MicrosoftGraphActivityLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-629" {
  display_name = "MicrosoftGraphPolicyLogs"
  name         = "MicrosoftGraphPolicyLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-630" {
  display_name = "MicrosoftHealthcareApisAuditLogs"
  name         = "MicrosoftHealthcareApisAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-631" {
  display_name = "MicrosoftServicePrincipalSignInLogs"
  name         = "MicrosoftServicePrincipalSignInLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-632" {
  display_name = "MySqlAuditLogs"
  name         = "MySqlAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-633" {
  display_name = "MySqlSlowLogs"
  name         = "MySqlSlowLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-634" {
  display_name = "NCBMBreakGlassAuditLogs"
  name         = "NCBMBreakGlassAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-635" {
  display_name = "NCBMSecurityDefenderLogs"
  name         = "NCBMSecurityDefenderLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-636" {
  display_name = "NCBMSecurityLogs"
  name         = "NCBMSecurityLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-637" {
  display_name = "NCBMSystemLogs"
  name         = "NCBMSystemLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-638" {
  display_name = "NCCIDRACLogs"
  name         = "NCCIDRACLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-639" {
  display_name = "NCCKubernetesAPIAuditLogs"
  name         = "NCCKubernetesAPIAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-640" {
  display_name = "NCCKubernetesLogs"
  name         = "NCCKubernetesLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-641" {
  display_name = "NCCPlatformOperationsLogs"
  name         = "NCCPlatformOperationsLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-642" {
  display_name = "NCCVMOrchestrationLogs"
  name         = "NCCVMOrchestrationLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-643" {
  display_name = "NCMClusterOperationsLogs"
  name         = "NCMClusterOperationsLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-644" {
  display_name = "NCSStorageAlerts"
  name         = "NCSStorageAlerts"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-645" {
  display_name = "NCSStorageAudits"
  name         = "NCSStorageAudits"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-646" {
  display_name = "NCSStorageLogs"
  name         = "NCSStorageLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-647" {
  display_name = "NGXOperationLogs"
  name         = "NGXOperationLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-648" {
  display_name = "NGXSecurityLogs"
  name         = "NGXSecurityLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-649" {
  display_name = "NSPAccessLogs"
  name         = "NSPAccessLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-650" {
  display_name = "NTAInsights"
  name         = "NTAInsights"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-651" {
  display_name = "NTAIpDetails"
  name         = "NTAIpDetails"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-652" {
  display_name = "NTANetAnalytics"
  name         = "NTANetAnalytics"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-653" {
  display_name = "NTANspRuleRecommendation"
  name         = "NTANspRuleRecommendation"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-654" {
  display_name = "NTARuleRecommendation"
  name         = "NTARuleRecommendation"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-655" {
  display_name = "NTATopologyDetails"
  name         = "NTATopologyDetails"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-656" {
  display_name = "NWConnectionMonitorDNSResult"
  name         = "NWConnectionMonitorDNSResult"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-657" {
  display_name = "NWConnectionMonitorDestinationListenerResult"
  name         = "NWConnectionMonitorDestinationListenerResult"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-658" {
  display_name = "NWConnectionMonitorPathResult"
  name         = "NWConnectionMonitorPathResult"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-659" {
  display_name = "NWConnectionMonitorTestResult"
  name         = "NWConnectionMonitorTestResult"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-660" {
  display_name = "NatGatewayFlowlogsV1"
  name         = "NatGatewayFlowlogsV1"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-661" {
  display_name = "NetworkAccessAlerts"
  name         = "NetworkAccessAlerts"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-662" {
  display_name = "NetworkAccessConnectionEvents"
  name         = "NetworkAccessConnectionEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-663" {
  display_name = "NetworkAccessGenerativeAIInsights"
  name         = "NetworkAccessGenerativeAIInsights"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-664" {
  display_name = "NetworkAccessTraffic"
  name         = "NetworkAccessTraffic"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-665" {
  display_name = "NginxUpstreamUpdateLogs"
  name         = "NginxUpstreamUpdateLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-666" {
  display_name = "OEPAirFlowTask"
  name         = "OEPAirFlowTask"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-667" {
  display_name = "OEPAuditLogs"
  name         = "OEPAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-668" {
  display_name = "OEPDataplaneLogs"
  name         = "OEPDataplaneLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-669" {
  display_name = "OEPElasticOperator"
  name         = "OEPElasticOperator"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-670" {
  display_name = "OEPElasticsearch"
  name         = "OEPElasticsearch"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-671" {
  display_name = "OEWAuditLogs"
  name         = "OEWAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-672" {
  display_name = "OEWExperimentAssignmentSummary"
  name         = "OEWExperimentAssignmentSummary"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-673" {
  display_name = "OEWExperimentScorecardMetricPairs"
  name         = "OEWExperimentScorecardMetricPairs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-674" {
  display_name = "OEWExperimentScorecards"
  name         = "OEWExperimentScorecards"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-675" {
  display_name = "OGOAuditLogs"
  name         = "OGOAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-676" {
  display_name = "OLPSupplyChainEntityOperations"
  name         = "OLPSupplyChainEntityOperations"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-677" {
  display_name = "OLPSupplyChainEvents"
  name         = "OLPSupplyChainEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-678" {
  display_name = "OTelEvents"
  name         = "OTelEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-679" {
  display_name = "OTelLogs"
  name         = "OTelLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-680" {
  display_name = "OTelResources"
  name         = "OTelResources"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-681" {
  display_name = "OTelSpans"
  name         = "OTelSpans"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-682" {
  display_name = "OTelTraces"
  name         = "OTelTraces"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-683" {
  display_name = "OTelTracesAgent"
  name         = "OTelTracesAgent"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-684" {
  display_name = "OmsCustomerProfileFact"
  name         = "OmsCustomerProfileFact"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-685" {
  display_name = "Operation"
  name         = "Operation"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-686" {
  display_name = "OracleCloudDatabase"
  name         = "OracleCloudDatabase"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-687" {
  display_name = "PFTitleAuditLogs"
  name         = "PFTitleAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-688" {
  display_name = "PGSQLAutovacuumStats"
  name         = "PGSQLAutovacuumStats"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-689" {
  display_name = "PGSQLDbTransactionsStats"
  name         = "PGSQLDbTransactionsStats"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-690" {
  display_name = "PGSQLPgBouncer"
  name         = "PGSQLPgBouncer"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-691" {
  display_name = "PGSQLPgStatActivitySessions"
  name         = "PGSQLPgStatActivitySessions"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-692" {
  display_name = "PGSQLQueryStoreQueryText"
  name         = "PGSQLQueryStoreQueryText"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-693" {
  display_name = "PGSQLQueryStoreRuntime"
  name         = "PGSQLQueryStoreRuntime"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-694" {
  display_name = "PGSQLQueryStoreWaits"
  name         = "PGSQLQueryStoreWaits"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-695" {
  display_name = "PGSQLServerLogs"
  name         = "PGSQLServerLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-696" {
  display_name = "PaymentHsmHardwareOperationAuditLogs"
  name         = "PaymentHsmHardwareOperationAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-697" {
  display_name = "Perf"
  name         = "Perf"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-698" {
  display_name = "PerfInsightsFindings"
  name         = "PerfInsightsFindings"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-699" {
  display_name = "PerfInsightsImpactedResources"
  name         = "PerfInsightsImpactedResources"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-700" {
  display_name = "PerfInsightsRun"
  name         = "PerfInsightsRun"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-701" {
  display_name = "PowerBIDatasetsTenant"
  name         = "PowerBIDatasetsTenant"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-702" {
  display_name = "PowerBIDatasetsWorkspace"
  name         = "PowerBIDatasetsWorkspace"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-703" {
  display_name = "PreAuthenticationDiscoveryLogs"
  name         = "PreAuthenticationDiscoveryLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-704" {
  display_name = "PurviewDataSensitivityLogs"
  name         = "PurviewDataSensitivityLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-705" {
  display_name = "PurviewScanStatusLogs"
  name         = "PurviewScanStatusLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-706" {
  display_name = "PurviewSecurityLogs"
  name         = "PurviewSecurityLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-707" {
  display_name = "QuantumProviderAccountDeviceOperationLogs"
  name         = "QuantumProviderAccountDeviceOperationLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-708" {
  display_name = "QuantumProviderAccountJobAuditLogs"
  name         = "QuantumProviderAccountJobAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-709" {
  display_name = "QuantumProviderAccountMessageAuditLogs"
  name         = "QuantumProviderAccountMessageAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-710" {
  display_name = "QuantumProviderAccountQueueAuditLogs"
  name         = "QuantumProviderAccountQueueAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-711" {
  display_name = "QuantumProviderAccountTargetAuditLogs"
  name         = "QuantumProviderAccountTargetAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-712" {
  display_name = "QuantumWorkspaceJobAuditLogs"
  name         = "QuantumWorkspaceJobAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-713" {
  display_name = "REDConnectionEvents"
  name         = "REDConnectionEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-714" {
  display_name = "RemoteNetworkHealthLogs"
  name         = "RemoteNetworkHealthLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-715" {
  display_name = "ResourceManagementPublicAccessLogs"
  name         = "ResourceManagementPublicAccessLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-716" {
  display_name = "RetinaNetworkFlowLogs"
  name         = "RetinaNetworkFlowLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-717" {
  display_name = "SCCMAssessmentRecommendation"
  name         = "SCCMAssessmentRecommendation"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-718" {
  display_name = "SCGPoolExecutionLog"
  name         = "SCGPoolExecutionLog"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-719" {
  display_name = "SCGPoolRequestLog"
  name         = "SCGPoolRequestLog"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-720" {
  display_name = "SCOMAssessmentRecommendation"
  name         = "SCOMAssessmentRecommendation"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-721" {
  display_name = "SPAssessmentRecommendation"
  name         = "SPAssessmentRecommendation"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-722" {
  display_name = "SQLAssessmentRecommendation"
  name         = "SQLAssessmentRecommendation"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-723" {
  display_name = "SQLSecurityAuditEvents"
  name         = "SQLSecurityAuditEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-724" {
  display_name = "SVMPoolExecutionLog"
  name         = "SVMPoolExecutionLog"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-725" {
  display_name = "SVMPoolRequestLog"
  name         = "SVMPoolRequestLog"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-726" {
  display_name = "SecurityCaseEvent"
  name         = "SecurityCaseEvent"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-727" {
  display_name = "ServiceFabricOperationalEvent"
  name         = "ServiceFabricOperationalEvent"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-728" {
  display_name = "ServiceFabricReliableActorEvent"
  name         = "ServiceFabricReliableActorEvent"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-729" {
  display_name = "ServiceFabricReliableServiceEvent"
  name         = "ServiceFabricReliableServiceEvent"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-730" {
  display_name = "SfBAssessmentRecommendation"
  name         = "SfBAssessmentRecommendation"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-731" {
  display_name = "SfBOnlineAssessmentRecommendation"
  name         = "SfBOnlineAssessmentRecommendation"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-732" {
  display_name = "SharePointOnlineAssessmentRecommendation"
  name         = "SharePointOnlineAssessmentRecommendation"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-733" {
  display_name = "SignalRServiceDiagnosticLogs"
  name         = "SignalRServiceDiagnosticLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-734" {
  display_name = "SigninLogs"
  name         = "SigninLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-735" {
  display_name = "StorageAntimalwareScanResults"
  name         = "StorageAntimalwareScanResults"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-736" {
  display_name = "StorageBlobLogs"
  name         = "StorageBlobLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-737" {
  display_name = "StorageCacheOperationEvents"
  name         = "StorageCacheOperationEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-738" {
  display_name = "StorageCacheUpgradeEvents"
  name         = "StorageCacheUpgradeEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-739" {
  display_name = "StorageCacheWarningEvents"
  name         = "StorageCacheWarningEvents"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-740" {
  display_name = "StorageFileLogs"
  name         = "StorageFileLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-741" {
  display_name = "StorageMalwareScanningResults"
  name         = "StorageMalwareScanningResults"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-742" {
  display_name = "StorageMoverAuditLogs"
  name         = "StorageMoverAuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-743" {
  display_name = "StorageMoverCopyLogsFailed"
  name         = "StorageMoverCopyLogsFailed"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-744" {
  display_name = "StorageMoverCopyLogsTransferred"
  name         = "StorageMoverCopyLogsTransferred"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-745" {
  display_name = "StorageMoverJobRunLogs"
  name         = "StorageMoverJobRunLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-746" {
  display_name = "StorageQueueLogs"
  name         = "StorageQueueLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-747" {
  display_name = "StorageTableLogs"
  name         = "StorageTableLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-748" {
  display_name = "SucceededIngestion"
  name         = "SucceededIngestion"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-749" {
  display_name = "SynapseBigDataPoolApplicationsEnded"
  name         = "SynapseBigDataPoolApplicationsEnded"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-750" {
  display_name = "SynapseBuiltinSqlPoolRequestsEnded"
  name         = "SynapseBuiltinSqlPoolRequestsEnded"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-751" {
  display_name = "SynapseDXCommand"
  name         = "SynapseDXCommand"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-752" {
  display_name = "SynapseDXFailedIngestion"
  name         = "SynapseDXFailedIngestion"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-753" {
  display_name = "SynapseDXIngestionBatching"
  name         = "SynapseDXIngestionBatching"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-754" {
  display_name = "SynapseDXQuery"
  name         = "SynapseDXQuery"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-755" {
  display_name = "SynapseDXSucceededIngestion"
  name         = "SynapseDXSucceededIngestion"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-756" {
  display_name = "SynapseDXTableDetails"
  name         = "SynapseDXTableDetails"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-757" {
  display_name = "SynapseDXTableUsageStatistics"
  name         = "SynapseDXTableUsageStatistics"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-758" {
  display_name = "SynapseGatewayApiRequests"
  name         = "SynapseGatewayApiRequests"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-759" {
  display_name = "SynapseIntegrationActivityRuns"
  name         = "SynapseIntegrationActivityRuns"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-760" {
  display_name = "SynapseIntegrationPipelineRuns"
  name         = "SynapseIntegrationPipelineRuns"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-761" {
  display_name = "SynapseIntegrationTriggerRuns"
  name         = "SynapseIntegrationTriggerRuns"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-762" {
  display_name = "SynapseLinkEvent"
  name         = "SynapseLinkEvent"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-763" {
  display_name = "SynapseRbacOperations"
  name         = "SynapseRbacOperations"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-764" {
  display_name = "SynapseScopePoolScopeJobsEnded"
  name         = "SynapseScopePoolScopeJobsEnded"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-765" {
  display_name = "SynapseScopePoolScopeJobsStateChange"
  name         = "SynapseScopePoolScopeJobsStateChange"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-766" {
  display_name = "SynapseSqlPoolDmsWorkers"
  name         = "SynapseSqlPoolDmsWorkers"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-767" {
  display_name = "SynapseSqlPoolExecRequests"
  name         = "SynapseSqlPoolExecRequests"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-768" {
  display_name = "SynapseSqlPoolRequestSteps"
  name         = "SynapseSqlPoolRequestSteps"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-769" {
  display_name = "SynapseSqlPoolSqlRequests"
  name         = "SynapseSqlPoolSqlRequests"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-770" {
  display_name = "SynapseSqlPoolWaits"
  name         = "SynapseSqlPoolWaits"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-771" {
  display_name = "Syslog"
  name         = "Syslog"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-772" {
  display_name = "TOUserAudits"
  name         = "TOUserAudits"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-773" {
  display_name = "TOUserDiagnostics"
  name         = "TOUserDiagnostics"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-774" {
  display_name = "TSIIngress"
  name         = "TSIIngress"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-775" {
  display_name = "UCClient"
  name         = "UCClient"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-776" {
  display_name = "UCClientReadinessStatus"
  name         = "UCClientReadinessStatus"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-777" {
  display_name = "UCClientUpdateStatus"
  name         = "UCClientUpdateStatus"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-778" {
  display_name = "UCDOAggregatedStatus"
  name         = "UCDOAggregatedStatus"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-779" {
  display_name = "UCDOStatus"
  name         = "UCDOStatus"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-780" {
  display_name = "UCDeviceAlert"
  name         = "UCDeviceAlert"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-781" {
  display_name = "UCServiceUpdateStatus"
  name         = "UCServiceUpdateStatus"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-782" {
  display_name = "UCUpdateAlert"
  name         = "UCUpdateAlert"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-783" {
  display_name = "Usage"
  name         = "Usage"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-784" {
  display_name = "VCoreMongoRequests"
  name         = "VCoreMongoRequests"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-785" {
  display_name = "VIAudit"
  name         = "VIAudit"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-786" {
  display_name = "VIIndexing"
  name         = "VIIndexing"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-787" {
  display_name = "VMBoundPort"
  name         = "VMBoundPort"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-788" {
  display_name = "VMComputer"
  name         = "VMComputer"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-789" {
  display_name = "VMConnection"
  name         = "VMConnection"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-790" {
  display_name = "VMProcess"
  name         = "VMProcess"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-791" {
  display_name = "W3CIISLog"
  name         = "W3CIISLog"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-792" {
  display_name = "WOUserAudits"
  name         = "WOUserAudits"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-793" {
  display_name = "WOUserDiagnostics"
  name         = "WOUserDiagnostics"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-794" {
  display_name = "WVDAgentHealthStatus"
  name         = "WVDAgentHealthStatus"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-795" {
  display_name = "WVDAutoscaleEvaluationPooled"
  name         = "WVDAutoscaleEvaluationPooled"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-796" {
  display_name = "WVDCheckpoints"
  name         = "WVDCheckpoints"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-797" {
  display_name = "WVDConnectionGraphicsDataPreview"
  name         = "WVDConnectionGraphicsDataPreview"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-798" {
  display_name = "WVDConnectionNetworkData"
  name         = "WVDConnectionNetworkData"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-799" {
  display_name = "WVDConnections"
  name         = "WVDConnections"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-800" {
  display_name = "WVDErrors"
  name         = "WVDErrors"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-801" {
  display_name = "WVDFeeds"
  name         = "WVDFeeds"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-802" {
  display_name = "WVDHostRegistrations"
  name         = "WVDHostRegistrations"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-803" {
  display_name = "WVDManagement"
  name         = "WVDManagement"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-804" {
  display_name = "WVDMultiLinkAdd"
  name         = "WVDMultiLinkAdd"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-805" {
  display_name = "WVDSessionHostManagement"
  name         = "WVDSessionHostManagement"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-806" {
  display_name = "WebPubSubConnectivity"
  name         = "WebPubSubConnectivity"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-807" {
  display_name = "WebPubSubHttpRequest"
  name         = "WebPubSubHttpRequest"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-808" {
  display_name = "WebPubSubMessaging"
  name         = "WebPubSubMessaging"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-809" {
  display_name = "Windows365AuditLogs"
  name         = "Windows365AuditLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-810" {
  display_name = "Windows365CheckpointLogs"
  name         = "Windows365CheckpointLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-811" {
  display_name = "Windows365ConnectionErrorLogs"
  name         = "Windows365ConnectionErrorLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-812" {
  display_name = "Windows365ConnectionLogs"
  name         = "Windows365ConnectionLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-813" {
  display_name = "Windows365NetworkLogs"
  name         = "Windows365NetworkLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-814" {
  display_name = "WindowsClientAssessmentRecommendation"
  name         = "WindowsClientAssessmentRecommendation"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-815" {
  display_name = "WindowsServerAssessmentRecommendation"
  name         = "WindowsServerAssessmentRecommendation"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-816" {
  display_name = "WorkloadDiagnosticLogs"
  name         = "WorkloadDiagnosticLogs"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-817" {
  display_name = "ZTSGraph"
  name         = "ZTSGraph"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-818" {
  display_name = "ZTSJobStatus"
  name         = "ZTSJobStatus"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-819" {
  display_name = "ZTSMetadata"
  name         = "ZTSMetadata"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_log_analytics_workspace_table_custom_log" "res-820" {
  display_name = "ZTSRequest"
  name         = "ZTSRequest"
  workspace_id = azurerm_log_analytics_workspace.res-92.id
}
resource "azurerm_servicebus_namespace" "res-821" {
  location            = "eastus"
  name                = "senti-notificaciones-mq"
  resource_group_name = azurerm_resource_group.res-0.name
  sku                 = "Basic"
}
resource "azurerm_servicebus_namespace_authorization_rule" "res-822" {
  listen       = true
  manage       = true
  name         = "RootManageSharedAccessKey"
  namespace_id = azurerm_servicebus_namespace.res-821.id
  send         = true
}
resource "azurerm_mssql_server" "res-824" {
  administrator_login = "cbse-sentinel2026"
  location            = "westus2"
  name                = "cbse-sentinel2026"
  resource_group_name = azurerm_resource_group.res-0.name
  version             = "12.0"
  azuread_administrator {
    login_username = "david.alfonso.canas_gmail.com#EXT#@davidalfonsocanasgmail.onmicrosoft.com"
    object_id      = "5aade3f9-9c2d-4225-892d-151805b63f97"
  }
}
resource "azurerm_mssql_database_extended_auditing_policy" "res-839" {
  database_id            = "/subscriptions/246fb3a2-71ca-4779-9858-2e92aef6f9e2/resourceGroups/rg-sentinel/providers/Microsoft.Sql/servers/cbse-sentinel2026/databases/master"
  enabled                = false
  log_monitoring_enabled = false
}
resource "azurerm_mssql_database" "res-845" {
  name                 = "senti_datos_personales_db"
  server_id            = azurerm_mssql_server.res-824.id
  storage_account_type = "Local"
}
resource "azurerm_mssql_database_extended_auditing_policy" "res-851" {
  database_id            = azurerm_mssql_database.res-845.id
  enabled                = false
  log_monitoring_enabled = false
}
resource "azurerm_mssql_database" "res-857" {
  name                 = "sentirobosdb"
  server_id            = azurerm_mssql_server.res-824.id
  storage_account_type = "Local"
}
resource "azurerm_mssql_database_extended_auditing_policy" "res-863" {
  database_id            = azurerm_mssql_database.res-857.id
  enabled                = false
  log_monitoring_enabled = false
}
resource "azurerm_mssql_server_microsoft_support_auditing_policy" "res-869" {
  enabled                = false
  log_monitoring_enabled = false
  server_id              = azurerm_mssql_server.res-824.id
}
resource "azurerm_mssql_server_transparent_data_encryption" "res-870" {
  server_id = azurerm_mssql_server.res-824.id
}
resource "azurerm_mssql_server_extended_auditing_policy" "res-871" {
  enabled                = false
  log_monitoring_enabled = false
  server_id              = azurerm_mssql_server.res-824.id
}
resource "azurerm_mssql_firewall_rule" "res-872" {
  end_ip_address   = "0.0.0.0"
  name             = "AllowAllWindowsAzureIps"
  server_id        = azurerm_mssql_server.res-824.id
  start_ip_address = "0.0.0.0"
}
resource "azurerm_mssql_firewall_rule" "res-873" {
  end_ip_address   = "190.253.135.96"
  name             = "QueryEditorClientIPAddress_1789912095423"
  server_id        = azurerm_mssql_server.res-824.id
  start_ip_address = "190.253.135.96"
}
resource "azurerm_mssql_server_security_alert_policy" "res-875" {
  resource_group_name = azurerm_resource_group.res-0.name
  server_name         = "cbse-sentinel2026"
  state               = "Disabled"
  depends_on = [
    azurerm_mssql_server.res-824,
  ]
}
resource "azurerm_mssql_server_vulnerability_assessment" "res-877" {
  server_security_alert_policy_id = azurerm_mssql_server_security_alert_policy.res-875.id
  storage_container_path          = ""
}
