
module "eks" {
  source = "../modules/eks"

  eks_cluster_version = "1.30"
  subnet_ids = [
    element(module.vpc.private_subnets, 0),
    element(module.vpc.private_subnets, 1),
    element(module.vpc.public_subnets, 0),
    element(module.vpc.public_subnets, 1)
  ]

  eks_node_subnets = [
    element(module.vpc.private_subnets, 0),
    element(module.vpc.private_subnets, 1),
  ]

  eks_nodegroup_name      = "workload-nodegroup"
  max_size                = 3
  min_size                = 2
  desired_size            = 2
  eks_ssh_key_name        = "eks-keypair"
  name                    = var.cluster_name
  nodegroup_instance_type = ["t3.medium"]

  labels = {
    "instancePurpose" = "Workloads"
  }
  tags = {
    "alpha.eksctl.io/cluster-oidc-enabled" = "true"
  }

  asg_tags = merge({
    key                 = "k8s.io/cluster-autoscaler/${var.cluster_name}"
    value               = "owned"
    propagate_at_launch = true
    },
    {
      key                 = "k8s.io/cluster-autoscaler/enabled"
      value               = "true"
      propagate_at_launch = true
    },
    {
      key                 = "kubernetes.io/cluster/${var.cluster_name}"
      value               = "owned"
      propagate_at_launch = true
    },
    {
      key                 = "k8s.io/cluster-autoscaler/node-template/label/instancePurpose"
      value               = "mainWorkloads"
      propagate_at_launch = true
    }
  )
}


