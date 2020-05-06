// Create ALB to front the web app EC2 instances
module "alb_web-app" {
  source          = "../modules/alb"
  vpc             = module.vpc
  name            = "eb-web-app"
  description     = "Application Load Balancer for eb web app"
  security_groups = [module.sg_web-alb.id]
  subnets         = [module.subnets_us-west-2a.id, module.subnets_us-west-2b.id]

  listener = {
    port     = "80"
    protocol = "HTTP"
  }

  target_group = {
    group_name  = "web-app-8080"
    port        = "8080"
    protocol    = "HTTP"
    target_type = "instance"
    target_id   = [module.ec2_web-app.aws_instance.id]
  }
}
