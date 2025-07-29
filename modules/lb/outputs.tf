output "alb_dns_name" {
  value       = aws_lb.app_alb.dns_name
  description = "DNS name of the Application Load Balancer"
}

output "app_tg_arn" {
  description = "ARN of the application target group"
  value       = aws_lb_target_group.app_tg.arn
}
