terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}

#provider "kubernetes" {
#  config_path = "~/.kube/config"
#}

module "mongo" {
  source               = "./modules/mongo"
  kubernetes_namespace = "pac-man"
}