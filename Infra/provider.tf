terraform {
  required_providers {
    clouflare = {
      source  = "cloudflare/cloudflare"
      version = " ~> 5.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = " ~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region_id
}

provider "clouflare" {
  api_token = var.cloudflare_api_token
}