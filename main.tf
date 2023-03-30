terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_kubernetes_cluster" "this" {
  name   = var.cluster_name
  region = var.region

  version = var.kubernetes_version

  node_pool {
    name       = "worker-pool"
    size       = var.node_size
    node_count = var.node_count
  }
}

output "kubeconfig" {
  value = digitalocean_kubernetes_cluster.this.kube_config
  sensitive = true
}
