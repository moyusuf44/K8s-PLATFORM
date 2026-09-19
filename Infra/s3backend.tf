terraform {
  backend "s3" {
    bucket         = "moyusufs-k8s-app-terraform-state"
    key            = "k8s-app/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "terraform-k8sapp-state-lock"
    encrypt        = true
  }
}