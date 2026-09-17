resource "aws_ecr_repository" "this" {
    name = "k8s-app"

    image_scanning_configuration {
        scan_on_push = true 
    }
}