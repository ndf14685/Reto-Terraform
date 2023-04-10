output "load_balancer_ip" {
  value = helm_release.nginx_ingress.status
  description = "Status de nginx ingress"
}
