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
  chart      = "grafana"
  #namespace  = kubernetes_namespace.grafana.metadata.name
  
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



resource "kubernetes_service" "grafana_another_service" {
  metadata {
    name      = "kubernetes-service"
    namespace = helm_release.grafana.namespace

    labels = {
      Terraform = "true"
    }
    
  }
  spec {
    selector = {
      "app.kubernetes.io/instance" = helm_release.grafana.name
      "app.kubernetes.io/name"     = "grafana"
    }
  port {
    port        = 80
    target_port = 3000
  }
  type = "LoadBalancer"
  }
}


