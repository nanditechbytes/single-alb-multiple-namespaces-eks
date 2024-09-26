terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.26.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.20.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.9.0"
    }
  }
}

provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "terraform-backend-sandbox-infra"
    key    = "eks-infra"
    region = "ap-south-1"
  }
}
