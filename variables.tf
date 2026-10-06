variable "db_password" {
  description = "Admin password for the cbse-sentinel2026 SQL server, used by the container apps."
  type        = string
  sensitive   = true
}

variable "dockerhub_username"{
  description = "Docker Hub username used by the container apps to pull images."
  type        = string
  sensitive   = true
}

variable "dockerhub_token"{
  description = "Docker Hub personal access token used by the container apps to pull images."
  type        = string
  sensitive   = true
}

variable "servicebus_connection_string" {
  description = "Connection string for the senti-notificaciones-mq Service Bus namespace, used by the container apps."
  type        = string
  sensitive   = true
}

variable "firebase_credentials_json" {
  description = "Firebase service account key (full JSON file contents) used by senti-notificacion-ms."
  type        = string
  sensitive   = true
}

variable "image_repository" {
  description = "Docker Hub namespace that holds the image repositories for all container apps."
  type        = string
  default     = "registry.hub.docker.com/julian9999"
}

variable "senti_datos_personales_image_tag" {
  description = "Image tag deployed to the senti-datos-personales-ms container app."
  type        = string
  default     = "latest"
}

variable "senti_geolocalizacion_image_tag" {
  description = "Image tag deployed to the senti-geolocalizacion-ms container app."
  type        = string
  default     = "latest"
}

variable "senti_gestion_robos_image_tag" {
  description = "Image tag deployed to the senti-gestion-robos-ms container app."
  type        = string
  default     = "latest"
}

variable "senti_notificacion_image_tag" {
  description = "Image tag deployed to the senti-notificacion-ms container app."
  type        = string
  default     = "latest"
}
