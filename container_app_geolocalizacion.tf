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
