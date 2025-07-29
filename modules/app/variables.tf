variable "subnet_id" {
  description = "Subnet where the app will be deployed"
  type        = string
}

variable "app_sg_id" {
  description = "Security Group for the app"
  type        = string
}

variable "key_name" {
  description = "EC2 Key Pair for SSH access"
  type        = string
}
