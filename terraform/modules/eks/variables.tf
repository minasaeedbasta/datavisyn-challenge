variable "vpc_id" {
  description = "The ID of the VPC where the EKS cluster will be created"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnets for the EKS cluster"
  type        = list(string)
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "The version of the EKS cluster"
  type        = string
}

variable "cluster_tags" {
  description = "Tags to apply to the EKS cluster"
  type        = map(string)
}
