module "vpc" {
  source = "./modules/01-vpc"
}

module "ecr" {
    source = "./modules/02-ecr"
}

module "eks" {
  source = "./modules/03-eks"

  subnet_ids = module.vpc.public_subnets

  cluster_name = var.cluster_name
}