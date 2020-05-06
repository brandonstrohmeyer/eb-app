output "alb_fqdn" {
  description = "FQDN for App ALB"
  value       = module.alb_web-app.aws_lb.dns_name
}
