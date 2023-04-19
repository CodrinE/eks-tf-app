resource "kubernetes_service" "mongo" {
  metadata {
    name = var.mongo_db_name
    namespace = var.kubernetes_namespace

    labels = {
      name = var.mongo_db_name
    }
  }
  spec {
    port {
      port = var.mongo_port
      target_port = var.mongo_port
    }

    selector = {
      name = var.mongo_db_name
    }

    type = "LoadBalancer"
  }
}