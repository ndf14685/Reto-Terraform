output "kubeconfig" {
  value = {
    host                   = digitalocean_kubernetes_cluster.this.endpoint
    cluster_ca_certificate = digitalocean_kubernetes_cluster.this.kube_config[0].cluster_ca_certificate
  
    token                  = digitalocean_kubernetes_cluster.this.kube_config[0].token
  }
}
