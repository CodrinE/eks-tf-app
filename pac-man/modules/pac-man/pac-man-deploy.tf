resource "kubernetes_deployment" "pac-man" {
  metadata {
    name = var.app_name
    namespace = var.kubernetes_namespace

    labels = {
      name = var.app_name
    }
  }
  spec {
    replicas = 1

    selector {
      match_labels = {
        name = var.app_name
      }
    }
    template {
      metadata {
        labels = {
          name = var.app_name
        }
      }
      spec {
        container {
          name = var.app_name
          image = "docker.io/jessehoch/pacman-nodejs-app:latest"
          port {
            container_port = 8080
            name = "http-server"
          }
        }
      }
    }
  }
}