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
#  name   = var.cluster_name
#  region = var.region
  
#  node_pool {
#    name       = "worker-pool"
#    size       = var.cluster_size
#    node_count = 3
#    auto_scale = true
#    min_nodes = 1
#    max_nodes = 3
#  }

#  version = var.kubernetes_version


}

provider "kubernetes" {
  host                   = digitalocean_kubernetes_cluster.this.endpoint
  token                  = digitalocean_kubernetes_cluster.this.kube_config.0.token
  cluster_ca_certificate = base64decode(digitalocean_kubernetes_cluster.this.kube_config.0.cluster_ca_certificate)
}