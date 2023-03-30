variable "do_token" {
  description = "Your DigitalOcean API token"
  default     = "<your_digital_ocean_token>"
}

variable "cluster_name" {
  description = "The name of the Kubernetes cluster"
  default     = "do-k8s-cluster"
}

variable "region" {
  description = "The DigitalOcean region to create the cluster in"
  default     = "nyc1"
}

variable "kubernetes_version" {
  description = "The Kubernetes version for the cluster"
  default     = "1.22.2-do.0" 
}

variable "node_size" {
  description = "The size of the worker nodes"
  default     = "s-1vcpu-2gb"
}

variable "node_count" {
  description = "The number of worker nodes"
  default     = 3
}
