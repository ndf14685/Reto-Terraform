terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
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

resource "kubernetes_namespace" "this" {
  metadata {
    name = var.namespace
  }
}


resource "helm_release" "nginx_ingress" {
  name       = "nginx-ingress"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = var.chart_version
  namespace  = kubernetes_namespace.this.metadata[0].name
  set {
    name  = "controller.replicaCount"
    value = "2"
  }

  set {
    name  = "controller.service.type"
    value = "LoadBalancer"
  }
}



