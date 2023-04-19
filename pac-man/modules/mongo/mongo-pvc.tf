resource "kubernetes_persistent_volume_claim" "mongo_storage" {
  metadata {
    name = join("-", [var.mongo_db_name, "storage"])
    namespace = var.kubernetes_namespace
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "8Gi"
      }
    }

    storage_class_name = kubernetes_storage_class.mongo_sc.metadata.0.name
  }
}