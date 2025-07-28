provider "aws" {
  region = var.region
}

module "network" {
  source              = "./modules/network"
  region              = var.region
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}

module "security_app" {
  source           = "./modules/security_app"
  vpc_id           = module.network.vpc_id
  app_cidr_ingress = ["0.0.0.0/0"] # Permitir HTTP/HTTPS desde cualquier IP
  ssh_cidr         = var.ssh_cidr  # IP personal definida en terraform.tfvars
}
