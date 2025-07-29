output "app_sg_id" {
  description = "ID del Security Group de la aplicación web"
  value       = module.security_app.app_sg_id
}

output "alb_dns_name" {
  value       = module.lb.alb_dns_name
  description = "DNS público del ALB"
}
