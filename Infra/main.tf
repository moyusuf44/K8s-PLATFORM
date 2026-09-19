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
  addon_name   = var.addon_name
  desired_size = var.desired_size
  max_size     = var.max_size
  min_size     = var.min_size
}

module "alb" {
  source = "./modules/04-alb"

  cluster_name = var.cluster_name
}

module "acm" {
  source = "./modules/05-acm"

  domain_name = var.domain_name
  subdomain   = var.subdomain
}

module "cloudflare" {
  source = "./modules/06-cloudflare"

  zone_name = var.zone_name
}