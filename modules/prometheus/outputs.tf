output "prometheus_server_ip" {
#  value = kubernetes_service.this.status[0].load_balancer.ingress[0].ip
  description = "The URL for accessing Prometheus."
  value       = "http://${helm_release.prometheus.metadata[0].name}-prometheus-server.monitoring.svc.cluster.local"
}
