output "prometheus_server_ip" {
  value = module.prometheus.prometheus_server_ip
}
output "nginx_ingress_service" {
  description = "Información del servicio Nginx Ingress"
  value       = module.nginx_ingress.load_balancer_ip
}

output "grafana_lb_ip" {
  description = "URL del servicio Grafana LoadBalancer"
  value       = module.grafana.grafana_url
}
