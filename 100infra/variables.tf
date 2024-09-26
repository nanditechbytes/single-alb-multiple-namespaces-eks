variable "region" {
  description = "AWS Region for deployment"
  default     = "ap-south-1"
}

variable "cluster_name" {
  description = "EKS cluster name"
  default     = "sandbox-eks"
}

variable "cidr_range" {
  description = "VPC CIDR Range"
  default     = "10.0.0.0/24"
}