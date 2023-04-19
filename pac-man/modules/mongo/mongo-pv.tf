resource "kubernetes_persistent_volume" "mongo_pv" {
  metadata {
    name = join("-", [var.mongo_db_name, "pv"])
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    capacity     = {
      storage = "10Gi"
    }
    persistent_volume_reclaim_policy = "Retain"
    storage_class_name = kubernetes_storage_class.mongo_sc.metadata.0.name
    persistent_volume_source {
      host_path {
        path = "/mnt/data"
      }
    }
  }
}