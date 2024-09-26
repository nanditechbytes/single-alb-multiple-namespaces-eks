variable "capacity_type" {
  description = "Type of capacity associated with the EKS Node Group. Valid values: ON_DEMAND, SPOT. Terraform will only perform drift detection if a configuration value is provided."
  type        = string
  default     = "ON_DEMAND"
}

variable "desired_size" {
  description = "Count for desired size of eks nodegroup"
  type        = number
  default     = 1
}

variable "disk_size" {
  description = "Disk size for the eks nodegroup"
  type        = string
  default     = "20"
}

variable "eks_cluster_version" {
  description = "The version of the EKS cluster"
  type        = string
}

variable "eks_nodegroup_name" {
  description = "The name of the EKS Node Group"
  type        = string
}

variable "eks_ssh_key_name" {
  description = "The name of the SSH key used for EKS Node Group"
  type        = string
}


variable "eks_node_subnets" {
  description = "List of Subnets for EKS node group"
  type        = list(any)
}

variable "max_size" {
  description = "Count for max size of eks nodegroup"
  type        = number
  default     = 1
}

variable "min_size" {
  description = "Count for min size of eks nodegroup"
  type        = number
  default     = 1
}

variable "name" {
  description = "The name of the EKS cluster and related resources to be added to subnet tags"
  type        = string
}

variable "nodegroup_instance_type" {
  description = "List of instance type for EKS nodegroup"
  type        = list(any)
}

variable "subnet_ids" {
  description = "List of Subnets for EKS cluster"
  type        = list(any)
}

variable "tags" {
  description = "A map of tags to apply to all resources."
  type        = map(string)
  default     = {}
}

variable "asg_tags" {
  description = "A map of tags to apply to ASG resources."
  type        = map(any)
  default     = {}
}

variable "labels" {
  description = "A map of lables to apply to nodegroups."
  type        = map(any)
  default     = {}
}
