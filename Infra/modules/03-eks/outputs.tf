output "eks_cluster_name" {
  value = aws_eks_cluster.this.name
}

output "eks_addon_name" {
  value = aws_eks_addon.this.addon_name
}

output "eks_oidc_issuer" {
  value = aws_eks_cluster.this.identity[0].oidc[0].issuer
}