output "aws_lb" {
  description = "ALB output object"
  value       = aws_lb.this
}

output "aws_lb_target_group" {
  description = "Target group output object"
  value       = aws_lb_target_group.this
}

output "aws_lb_listener" {
  description = "Listener output object"
  value       = aws_lb_listener.this
}
