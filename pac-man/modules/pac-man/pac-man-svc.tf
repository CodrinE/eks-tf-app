resource "kubernetes_service" "pac-man" {
  metadata {
    name = var.app_name
    namespace = var.kubernetes_namespace

    labels = {
      name = var.app_name
    }
  }
  spec {
    port {
      port = 80
      protocol = "TCP"
      target_port = "8080"
    }

    selector = {
      name = var.app_name
    }

    type = "LoadBalancer"
  }
}