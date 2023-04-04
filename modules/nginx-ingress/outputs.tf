output "load_balancer_ip" {
#  value       = kubernetes_service.this.load_balancer_ingress[0].ip
  value = helm_release.nginx_ingress.status
  description = "Status de nginx ingress"
}
