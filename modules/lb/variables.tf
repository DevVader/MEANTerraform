variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "public_subnet_ids" {
  description = "IDs of the public subnets where the ALB will be deployed"
  type        = list(string)
}

variable "app_sg_id" {
  description = "Security Group ID for the ALB"
  type        = string
}
