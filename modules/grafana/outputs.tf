output "grafana_url" {
  value       = "http://${var.load_balancer_ip}:3000"
  description = "Grafana URL"
}
output "grafana_service" {
  description = "Información del servicio Grafana"
  value       = {
    name      = helm_release.grafana.metadata.name
    namespace = helm_release.grafana.metadata.namespace
  }
  depends_on = [helm_release.grafana]
}


