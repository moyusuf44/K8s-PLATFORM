output "openid_connect_provider_arn" {
  value = aws_iam_openid_connect_provider.this.arn
}

output "alb_controller_arn" {
  value = aws_iam_role.alb-controller.arn
}