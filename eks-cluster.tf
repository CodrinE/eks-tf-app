module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.0.4"

  cluster_name    = local.cluster_name
  cluster_version = "1.26"

  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.private_subnets
  cluster_endpoint_public_access = true

  eks_managed_node_group_defaults = {
    ami_type      = "AL2_x86_64"
    min_size      = 0
    max_size      = 3
    desired_size  = 0
    capacity_type = "ON_DEMAND"
  }

  eks_managed_node_groups = {
    one = {
      name           = "ng-1"
      instance_types = ["t2.micro"]

    }

    two = {
      name           = "ng-2"
      instance_types = ["t2.micro"]

    }
  }

}