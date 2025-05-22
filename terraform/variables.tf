variable "region" {
  type    = string
  default = "us-east-1"
}

variable "cluster_name" {
  type    = string
  default = "main"
}

variable "cluster_version" {
  type        = string
  default     = "1.32"
  description = "The version of the EKS cluster"
}

variable "cluster_tags" {
  type = map(string)
  default = {
    Environment = "dev"
    Terraform   = "true"
  }
}

variable "vpc_name" {
  type        = string
  default     = "main"
  description = "The name of the VPC"
}

variable "vpc_tags" {
  type = map(string)
  default = {
    "name" = "main"
  }
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.0.0.0/24","10.0.1.0/24"]
}

variable "private_subnets" {
  type    = list(string)
  default = ["10.0.2.0/24","10.0.3.0/24"]
}
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}
