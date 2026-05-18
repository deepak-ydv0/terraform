module "eks" {

  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = local.name
  kubernetes_version = "1.32"

  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets
  control_plane_subnet_ids = module.vpc.intra_subnets

  addons = {
    vpc-cni = {
      most_recent = true
    }

    kube-proxy = {
      most_recent = true
    }

    coredns = {
      most_recent = true
    }
  }

  eks_managed_node_groups = {

    tws_cluster_ng = {

      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["t3.medium"]

      min_size     = 2
      max_size     = 4
      desired_size = 2

      capacity_type = "SPOT"

      attach_cluster_primary_security_group = true
    }
  }

  tags = {
    Environment = local.env
    Terraform   = "true"
  }
}