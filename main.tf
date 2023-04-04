provider "digitalocean" {
  token = var.digitalocean_token
}

module "kubernetes_cluster" {
  source = "./modules/kubernetes-cluster"

  digitalocean_token = var.digitalocean_token
  region             = var.region
  cluster_name       = var.cluster_name
  cluster_size       = var.cluster_size
  kubernetes_version = var.kubernetes_version
}

module "prometheus" {
  source = "./modules/prometheus"

  kubernetes_cluster = module.kubernetes_cluster.kubeconfig
}

module "nginx_ingress" {
  source = "./modules/nginx-ingress"

  kubernetes_cluster = module.kubernetes_cluster.kubeconfig
  do_token           = var.digitalocean_token
}

module "grafana" {
  source = "./modules/grafana"

  kubernetes_cluster     = module.kubernetes_cluster.kubeconfig
  do_token               = var.digitalocean_token
  grafana_admin_password = var.grafana_admin_password
}
