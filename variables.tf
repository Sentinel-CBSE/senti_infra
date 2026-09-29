variable "db_password" {
  description = "Admin password for the cbse-sentinel2026 SQL server, used by the container apps."
  type        = string
  sensitive   = true
}

variable "dockerhub_pat" {
  description = "Docker Hub personal access token used by the container apps to pull images."
  type        = string
  sensitive   = true
}
