variable "region" {
  description = "AWS Region for deployment"
  default     = "ap-south-1"
}

variable "cluster_name" {
  description = "EKS cluster name"
  default     = "sandbox-eks"
}