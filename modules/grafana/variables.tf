
variable "do_token" {
  type        = string
#  description = "DigitalOcean API token"
}

variable "kubernetes_cluster" {
  description = "Información del clúster de Kubernetes."
  type = object({
    host                   = string
    cluster_ca_certificate = string
    token                  = string
  })
}

variable "grafana_admin_password" {
  description = "La contraseña de administrador para Grafana"
  default     = "admin"
}
