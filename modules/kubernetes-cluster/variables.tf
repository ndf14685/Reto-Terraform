variable "digitalocean_token" {
  description = "Token de la API de DigitalOcean."
  default = "dop_v1_205dde9f1f6c3808969e46802441c9f2c68a451a9234326d567b2c9bba107adb"
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
