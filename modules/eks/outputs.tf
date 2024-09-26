output "eks_endpoint" {
  description = "Endpoint of EKS"
  value       = aws_eks_cluster.sandbox.endpoint
}

output "name" {
  description = "Assigned name of the EKS Cluster"
  value       = aws_eks_cluster.sandbox.id
}

output "url" {
  value = aws_eks_cluster.sandbox.identity[0].oidc[0].issuer
}