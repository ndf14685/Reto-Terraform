variable "digitalocean_token" {
  description = "Token de la API de DigitalOcean."
  default = "TU_TOKEN_DIG_OCEAN"
}

variable "region" {
  description = "Región de DigitalOcean para el clúster de Kubernetes."
  default     = "nyc1"
}

variable "cluster_name" {
  description = "Nombre del clúster de Kubernetes."
  default     = "my-k8s-cluster"
}

variable "cluster_size" {
  description = "Tamaño del clúster de Kubernetes."
  default     = "s-2vcpu-4gb"
}

variable "kubernetes_version" {
  description = "Versión de Kubernetes para el clúster."
  default     = "1.22.2-do.2"
}
variable "domain" {
  description = "The domain name to use for Grafana"
  type        = string
  default = "nestorfleitas.ar"
}

variable "grafana_admin_password" {
  description = "La contraseña de administrador para Grafana"
  default     = "admin"
}