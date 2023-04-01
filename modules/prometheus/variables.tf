variable "kubernetes_cluster" {
  description = "Información del clúster de Kubernetes."
  type = object({
    host                   = string
    cluster_ca_certificate = string
    token                  = string
  })
}

variable "namespace" {
  description = "Namespace de Kubernetes para Prometheus."
  default     = "monitoring"
}

variable "chart_version" {
  description = "Versión del Helm chart para Prometheus."
  default     = "15.4.4"
}
