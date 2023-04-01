output "grafana_url" {
  value       = "http://${var.load_balancer_ip}:3000"
  description = "Grafana URL"
}
