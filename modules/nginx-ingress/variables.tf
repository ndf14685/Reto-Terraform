variable "cluster_id" {
  type        = string
  description = "DigitalOcean Kubernetes cluster ID"
}

variable "cluster_endpoint" {
  type        = string
  description = "DigitalOcean Kubernetes cluster endpoint"
}

variable "kubernetes_cluster" {
  description = "Información del clúster de Kubernetes."
  type = object({
    host                   = string
    cluster_ca_certificate = string
    token                  = string
  })
}

variable "namespace" {
  description = "Namespace de Kubernetes para el controlador de ingreso Nginx."
  default     = "ingress-nginx"
}

variable "chart_version" {
  description = "Versión del Helm chart para el controlador de ingreso Nginx."
  default     = "4.0.6"
}

variable "do_token" {
  type        = string
  description = "DigitalOcean API token"
}
