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
