terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}
locals {
  kubeconfig = {
    host                   = var.kubernetes_cluster.host
    cluster_ca_certificate = var.kubernetes_cluster.cluster_ca_certificate
    token                  = var.kubernetes_cluster.token
  }
}


provider "kubernetes" {
    host                   = local.kubeconfig.host
    cluster_ca_certificate = base64decode(local.kubeconfig.cluster_ca_certificate)
    token                  = local.kubeconfig.token
}


provider "helm" {
  kubernetes {
    host                   = local.kubeconfig.host
    cluster_ca_certificate = base64decode(local.kubeconfig.cluster_ca_certificate)
    token                  = local.kubeconfig.token
  }
}

provider "digitalocean" {
  token = var.do_token
}

resource "helm_release" "grafana" {
  name       = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana/grafana"

  set {
    name  = "persistence.size"
    value = "10Gi"
  }

  set {
    name  = "adminPassword"
    value = var.grafana_admin_password
  }
  set {
    name  = "service.type"
    value = "LoadBalancer"
  }
}

resource "kubernetes_service" "grafana_service" {
  metadata {
    name      = module.grafana.grafana_service.name
    namespace = module.grafana.grafana_service.namespace
  }
}