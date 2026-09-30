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
variable "image_repository" {
  description = "Docker Hub repository that holds the images for all container apps."
  type        = string
  default     = "registry.hub.docker.com/dcanasp/senti_robos"
}

variable "senti_datos_personales_image_tag" {
  description = "Image tag deployed to the senti-datos-personales container app."
  type        = string
  default     = "senti_datos"
}

variable "test_image_tag" {
  description = "Image tag deployed to the test container app."
  type        = string
  default     = "9-20"
}
