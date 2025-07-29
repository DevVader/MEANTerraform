provider "aws" {
  region = var.region
}

module "network" {
  source                = "./modules/network"
  region                = var.region
  vpc_cidr              = var.vpc_cidr
  public_subnet_cidr    = var.public_subnet_cidr
  public_subnet_cidr_b  = var.public_subnet_cidr_b
  private_subnet_cidr   = var.private_subnet_cidr
}

module "security_app" {
  source           = "./modules/security_app"
  vpc_id           = module.network.vpc_id
  app_cidr_ingress = ["0.0.0.0/0"] # Permitir HTTP/HTTPS desde cualquier IP
  ssh_cidr         = var.ssh_cidr  # IP personal definida en terraform.tfvars
}

module "lb" {
  source            = "./modules/lb"
  vpc_id            = module.network.vpc_id
  public_subnet_ids = module.network.public_subnet_ids # puedes agregar más si deseas alta disponibilidad
  app_sg_id         = module.security_app.app_sg_id
}

module "mongo" {
  source    = "./modules/mongo"
  subnet_id = module.network.private_subnet_id
  app_sg_id = module.security_app.app_sg_id
  key_name  = "test_vm_key"
}

module "app" {
  source    = "./modules/app"
  subnet_id = module.network.public_subnet_ids[0]
  app_sg_id = module.security_app.app_sg_id
  key_name  = "test_vm_key"
}

resource "aws_lb_target_group_attachment" "app_attachment" {
  target_group_arn = module.lb.app_tg_arn
  target_id        = module.app.app_id
  port             = 80
}

