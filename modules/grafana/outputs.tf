output "grafana_service" {
  description = "Información del servicio Grafana"
  value       = {
    name      = helm_release.grafana.name
    namespace = helm_release.grafana.namespace
  }
  depends_on = [helm_release.grafana]
}



output "grafana_lb_ip" {
  description = "Dirección IP del servicio Grafana LoadBalancer"
#  value       = kubernetes_service.grafana_another_service.load_balancer_ingress[0].ip
  value       = kubernetes_service.grafana_another_service.status[0].load_balancer[0].ingress[0].ip

}

output "grafana_lb_port" {
  description = "Puerto del servicio Grafana LoadBalancer"
  value       = kubernetes_service.grafana_another_service.spec[0].port[0].port
}
