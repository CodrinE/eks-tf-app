variable "kubernetes_namespace" {}

variable "mongo_port" {
  type = number
  default = 27017
}

variable mongo_db_name {
  type = string
  default = "mongo"
}