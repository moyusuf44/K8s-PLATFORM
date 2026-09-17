module "vpc" {
  source = "./modules/01-vpc"
}

module "ecr" {
    source = "./modules/02-ecr"
}