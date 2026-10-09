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
