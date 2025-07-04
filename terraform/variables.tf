variable "region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "EKS Cluster name"
  default     = "appscrip-cluster"
}

variable "node_instance_type" {
  description = "Instance type for EKS nodes"
  default     = "t3.medium"
}
