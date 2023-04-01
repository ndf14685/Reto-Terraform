terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}
provider "helm" {
  kubernetes {
    host                   = var.cluster_endpoint
    token                  = var.cluster_token
    cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
  }
}

provider "digitalocean" {
  token = var.do_token
}

resource "helm_release" "grafana" {
  name       = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"

  set {
    name  = "persistence.size"
    value = "10Gi"
  }

  set {
    name  = "adminPassword"
    value = "admin"
  }
}
