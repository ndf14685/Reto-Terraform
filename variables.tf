variable "do_token" {
  description = "Your DigitalOcean API token"
  #default     = "<your_digital_ocean_token>"  #Variable en entorno local
}

variable "cluster_name" {
  description = "The name of the Kubernetes cluster"
  default     = "k8s-cluster"
}

variable "region" {
  description = "The DigitalOcean region to create the cluster in"
  default     = "nyc1"
}

variable "kubernetes_version" {
  description = "The Kubernetes version for the cluster"
  default     = "1.26.3-do.0" 
}

variable "node_size" {
  description = "The size of the worker nodes"
  default     = "s-1vcpu-2gb"
}

variable "node_count" {
  description = "The number of worker nodes"
  default     = 3
}

variable "domain" {
  description = "The domain name to use for Grafana"
  type        = string
}

variable "grafana_admin_password" {
  description = "The Grafana admin password"
  type        = string
}
