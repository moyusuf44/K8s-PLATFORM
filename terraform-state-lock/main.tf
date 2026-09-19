resource "aws_dynamodb_table" "terraform-k8sapp-state-lock" {
    name         = "terraform-k8sapp-state-lock"
    billing_mode = "PAY_PER_REQUEST"
    hash_key     = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }
}


