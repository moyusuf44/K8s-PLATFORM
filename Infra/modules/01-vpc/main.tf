module "vpc" {
    source                  = "terraform-aws-modules/vpc/aws"
    version                 = "5.8.1"

    name                    = "moyusufs-k8s-app"
    cidr                    = "10.0.0.0/22"

    azs                     = ["eu-north-1a", "eu-north-1b", "eu-north-1c"] 
    public_subnets          = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]

    enable_nat_gateway      = false
    single_nat_gateway      = false 

    enable_dns_support      = true
    enable_dns_hostnames    = true

    map_ip_on_launch        = true

    tags = {
        Terraform  = true
        Enviroment = "dev"
    }
}

resource "ecs_security_group" "this" {
    name   = "k8s-app-sg"
    vpc_id = module.vpc.vpc_id

    ingress {
        from_port   = 5000
        to_port     = 5000
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }  
}