// Create ALB
resource "aws_lb" "this" {
  name            = var.name
  security_groups = var.security_groups
  subnets         = var.subnets
}

// Create target group
resource "aws_lb_target_group" "this" {
  name        = var.target_group.group_name
  port        = var.target_group.port
  protocol    = var.target_group.protocol
  target_type = var.target_group.target_type
  vpc_id      = var.vpc["vpc_id"]
}

// Attach targets to target group
resource "aws_lb_target_group_attachment" "this" {
  count            = length(var.target_group.target_id)
  target_group_arn = aws_lb_target_group.this.arn
  target_id        = element(var.target_group.target_id, count.index)
}

// Create a listener and attach target group
resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = var.listener.port
  protocol          = var.listener.protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}
