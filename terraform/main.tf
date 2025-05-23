module "vpc" {
  source          = "./modules/vpc"
  name            = var.vpc_name
  cidr            = var.vpc_cidr
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  vpc_tags        = var.vpc_tags
}

module "eks" {
  source          = "./modules/eks"
  vpc_id          = module.vpc.vpc_id
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  cluster_tags    = var.cluster_tags
  private_subnets = module.vpc.private_subnets_ids
}

module "helm" {
  source     = "./modules/helm"
  depends_on = [module.eks]
}

module "k8s" {
  source     = "./modules/k8s"
  depends_on = [module.helm]
}
