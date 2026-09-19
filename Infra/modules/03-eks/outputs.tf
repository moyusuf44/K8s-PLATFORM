output "eks_cluster_name" {
  value = aws_eks_cluster.this.name
}

output "eks_addon_name" {
  value = aws_eks_addon.this.name 
}