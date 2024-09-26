# eks

This module sets up eks cluster with node group for an account in a specific region.
For adding more node groups to the cluster please use nodegroup module.

## Basic Usage

```HCL
module "eks" {
source = "../modules/eks"

eks_cluster_version = "1.23"
subnet_ids = [
  element(module.base_network.private_subnets, 0),
  element(module.base_network.private_subnets, 1),
  element(module.base_network.public_subnets, 0),
  element(module.base_network.public_subnets, 1)
]

eks_node_subnets = [
  element(module.base_network.private_subnets, 0),
  element(module.base_network.private_subnets, 1)
]

eks_nodegroup_name      = "test"
eks_ssh_key_name        = "457384798757-eu-west-1-development-eks"
environment             = "test"
name                    = "test"
nodegroup_instance_type = ["t3.medium"]
tags = {
  purpose = "testing"
}
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.eks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_eks_cluster.sandbox](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster) | resource |
| [aws_eks_node_group.nodes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_iam_policy.aws_alb_ingress_controller](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.eks_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.eks_node](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEKSClusterPolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEKSServicePolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonSSM](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.aws_alb_ingress_controller](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.aws_alb_ingress_controller](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_asg_tags"></a> [asg\_tags](#input\_asg\_tags) | A map of tags to apply to ASG resources. | `map(any)` | `{}` | no |
| <a name="input_capacity_type"></a> [capacity\_type](#input\_capacity\_type) | Type of capacity associated with the EKS Node Group. Valid values: ON\_DEMAND, SPOT. Terraform will only perform drift detection if a configuration value is provided. | `string` | `"ON_DEMAND"` | no |
| <a name="input_desired_size"></a> [desired\_size](#input\_desired\_size) | Count for desired size of eks nodegroup | `number` | `1` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | Disk size for the eks nodegroup | `string` | `"20"` | no |
| <a name="input_eks_cluster_version"></a> [eks\_cluster\_version](#input\_eks\_cluster\_version) | The version of the EKS cluster | `string` | n/a | yes |
| <a name="input_eks_node_subnets"></a> [eks\_node\_subnets](#input\_eks\_node\_subnets) | List of Subnets for EKS node group | `list(any)` | n/a | yes |
| <a name="input_eks_nodegroup_name"></a> [eks\_nodegroup\_name](#input\_eks\_nodegroup\_name) | The name of the EKS Node Group | `string` | n/a | yes |
| <a name="input_eks_ssh_key_name"></a> [eks\_ssh\_key\_name](#input\_eks\_ssh\_key\_name) | The name of the SSH key used for EKS Node Group | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The name of the environment, e.g. Production, Development, etc. | `string` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | A map of lables to apply to nodegroups. | `map(any)` | `{}` | no |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | Count for max size of eks nodegroup | `number` | `1` | no |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | Count for min size of eks nodegroup | `number` | `1` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the EKS cluster and related resources to be added to subnet tags | `string` | n/a | yes |
| <a name="input_nodegroup_instance_type"></a> [nodegroup\_instance\_type](#input\_nodegroup\_instance\_type) | List of instance type for EKS nodegroup | `list(any)` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of Subnets for EKS cluster | `list(any)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to apply to all resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_eks_endpoint"></a> [eks\_endpoint](#output\_eks\_endpoint) | Endpoint of EKS |
| <a name="output_name"></a> [name](#output\_name) | Assigned name of the EKS Cluster |
