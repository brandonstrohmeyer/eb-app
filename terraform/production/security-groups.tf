// Build security group for the app ALB
module "sg_web-alb" {
  source      = "../modules/security-group"
  name        = "sg_web-alb"
  description = "Web App ALB"
  vpc         = module.vpc

  rules = [
    {
      type        = "egress"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      description = "Outbound Traffic"
      cidr        = ["0.0.0.0/0"]
    },
    {
      type        = "ingress"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "Allow inbound web traffic to ALB"
      cidr        = ["0.0.0.0/0"]
    },
  ]
}

// Build security group for the app EC2 instances
module "sg_web-ec2" {
  source      = "../modules/security-group"
  name        = "sg_web-ec2"
  description = "Allow inbound traffic from the Web App ALB"
  vpc         = module.vpc

  rules = [
    {
      type        = "egress"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      description = "Outbound Traffic"
      cidr        = ["0.0.0.0/0"]
    },
    {
      type        = "ingress"
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      description = "Web traffic from ALB"
      source_sg   = module.sg_web-alb.id
    },
  ]
}
