module "vpc" {
  source               = "../modules/basenetwork"
  az_count             = 2
  name                 = "centralized-cicd-vpc"
  cidr_range           = var.cidr_range
  private_cidr_ranges  = ["10.0.0.0/26", "10.0.0.64/26"]
  public_cidr_ranges   = ["10.0.0.128/26", "10.0.0.192/26"]
  private_subnet_names = ["private-subnet"]
  public_subnet_names  = ["public-subnet"]
  single_nat           = true
  environment          = "EKS"
  public_subnet_tags = [{
    "kubernetes.io/role/elb" = 1
    }
  ]
}