variable "digitalocean_token" {
  description = "Token de la API de DigitalOcean."
  default = "dop_v1_5c23e664a7c008ffba6942ece0196f5fa7e2712c73da91835ac188a79d3c0b4d"
}

variable "region" {
  description = "Región de DigitalOcean para el clúster de Kubernetes."
  default     = "nyc1"
}

variable "cluster_name" {
  description = "Nombre del clúster de Kubernetes."
  default     = "MyCluster"
}

variable "cluster_size" {
  description = "Tamaño del clúster de Kubernetes."
  default     = "s-2vcpu-4gb"
}

variable "kubernetes_version" {
  description = "Versión de Kubernetes de Dig Ocean para el clúster."
  default     = "1.26.3-do.0"

}
