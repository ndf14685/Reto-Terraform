terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}
provider "digitalocean" {
  token = var.digitalocean_token
}

resource "digitalocean_kubernetes_cluster" "this" {
  name   = "k8s-cluster"
  region = "nyc1"

  version = "1.26.3-do.0"
  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-4gb"
    node_count = 3
  }

}

provider "kubernetes" {
  host                   = digitalocean_kubernetes_cluster.this.endpoint
  token                  = digitalocean_kubernetes_cluster.this.kube_config.0.token
  cluster_ca_certificate = base64decode(digitalocean_kubernetes_cluster.this.kube_config.0.cluster_ca_certificate)
}