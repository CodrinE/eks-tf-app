resource "kubernetes_deployment" "mongo" {
  metadata {
    name = var.mongo_db_name
    namespace = var.kubernetes_namespace

    labels = {
      name = var.mongo_db_name
    }
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        name = var.mongo_db_name
      }
    }
    template {
      metadata {
        labels = {
          name= var.mongo_db_name
        }
      }
      spec {
        volume {
          name = join("-", [var.mongo_db_name, "db"])
          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim.mongo_storage.metadata.0.name
          }
        }

        container {
          name = var.mongo_db_name
          image = "mongo"

          port {
            container_port = var.mongo_port
            name = var.mongo_db_name
          }

          volume_mount {
            mount_path = "/mnt/data/db"
            name       = join("-", [var.mongo_db_name, "db"])
          }
        }
      }
    }
  }
}