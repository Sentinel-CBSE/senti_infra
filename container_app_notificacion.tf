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
