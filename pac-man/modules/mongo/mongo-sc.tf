resource "kubernetes_storage_class" "mongo_sc" {
  storage_provisioner = "kubernetes.io/aws-ebs"
  reclaim_policy = "Retain"
  parameters = {
    fsType = "ext4"
    type = "gp2"
  }

  metadata {
    name = join("-", [var.mongo_db_name, "sc"])
    annotations = {
      "storageclass.kubernetes.io/is-default-class" = "true"
    }
  }
}