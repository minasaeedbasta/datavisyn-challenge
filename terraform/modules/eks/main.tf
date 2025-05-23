module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.31"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  cluster_endpoint_public_access = true

  cluster_addons = {
    coredns                = {}
    eks-pod-identity-agent = {}
    kube-proxy             = {}
    vpc-cni                = {}
  }

  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {
    default = {
      ami_type       = "BOTTLEROCKET_x86_64"
      instance_types = ["t3.small", "t3.medium"]

      min_size     = 2
      max_size     = 10
      desired_size = 2
    }
  }

  vpc_id     = var.vpc_id
  subnet_ids = var.private_subnets

  node_security_group_additional_rules = {
    sealed_secrets_ingress = {
      description                   = "Sealed Secrets controller access"
      protocol                      = "tcp"
      from_port                     = 8080
      to_port                       = 8080
      type                          = "ingress"
      source_cluster_security_group = true
    }
  }

  tags = var.cluster_tags
}
