variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "app_cidr_ingress" {
  description = "CIDR blocks permitidos para la app (ej. 0.0.0.0/0)"
  type        = list(string)
}

variable "ssh_cidr" {
  description = "CIDR permitido para SSH"
  type        = list(string)
}
