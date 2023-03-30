output "cluster_name" {
  value = digitalocean_kubernetes_cluster.this.name
}

output "cluster_endpoint" {
  value = digitalocean_kubernetes_cluster.this.endpoint
}
