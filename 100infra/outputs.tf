output "alb_controller_role_arn" {
  value = aws_iam_role.lb_controller_role.arn
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "vpc_id" {
  value = module.vpc.vpc_id
}