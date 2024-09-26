
data "terraform_remote_state" "infra" {
  backend = "s3"
  config = {
    bucket = "terraform-backend-sandbox-infra"
    key    = "eks-infra"
    region = "ap-south-1"
  }
}

# ALB Driver
resource "kubernetes_service_account" "aws_load_balancer_controller" {
  metadata {
    name      = "aws-load-balancer-controller"
    namespace = "kube-system"

    labels = {
      "app.kubernetes.io/component" = "controller"
      "app.kubernetes.io/name"      = "aws-load-balancer-controller"
    }

    annotations = {
      "eks.amazonaws.com/role-arn" = data.terraform_remote_state.infra.outputs.alb_controller_role_arn
    }
  }
}

resource "helm_release" "aws_load_balancer_controller" {
  name      = "aws-load-balancer-controller"
  chart     = "./helm/aws-load-balancer-controller"
  namespace = "kube-system"
  set {
    name  = "clusterName"
    value = "var.cluster_name"
  }

  set {
    name  = "serviceAccount.name"
    value = "aws-load-balancer-controller"
  }

  set {
    name  = "serviceAccount.create"
    value = "false"
  }

  set {
    name = "vpcId"
    value = data.terraform_remote_state.infra.outputs.vpc_id
  }
}