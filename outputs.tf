output "app_sg_id" {
  description = "ID del Security Group de la aplicación web"
  value       = module.security_app.app_sg_id
}

output "alb_dns_name" {
  value       = module.lb.alb_dns_name
  description = "DNS público del ALB"
}

output "app_public_ip" {
  description = "IP pública de la instancia App"
  value       = module.app.app_public_ip
}

output "app_private_ip" {
  description = "IP privada de la instancia App"
  value       = module.app.app_private_ip
}

output "mongo_private_ip" {
  description = "IP privada de la instancia MongoDB"
  value       = module.mongo.mongo_private_ip
}