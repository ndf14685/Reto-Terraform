variable "cluster_id" {
  type        = string
  description = "DigitalOcean Kubernetes cluster ID"
}

variable "cluster_endpoint" {
  type        = string
  description = "DigitalOcean Kubernetes cluster endpoint"
#  default = module.kubernetes-cluster.endpoint
}

variable "cluster_token" {
  type        = string
  description = "DigitalOcean Kubernetes cluster token"
#  default = module.kubernetes-cluster.cluster_token
}

variable "cluster_ca_certificate" {
  type        = string
  description = "DigitalOcean Kubernetes cluster CA certificate"
#  default = module.kubernetes-cluster.cluster_ca_certificate
}

variable "do_token" {
  type        = string
#  description = "DigitalOcean API token"
}

variable "load_balancer_ip" {
  type        = string
  description = "Load balancer IP address"
}
