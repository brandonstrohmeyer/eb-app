// Get most recent app AMI
data "aws_ami" "eb-app" {
  most_recent      = true
  owners           = ["self"]

  filter {
    name   = "name"
    values = ["eb-web-app-*"]
  }
}

// Build new ec2 instance to support the web app
module "ec2_web-app" {
  source          = "../modules/ec2"
  ami_id          = data.aws_ami.eb-app.id
  keypair         = module.vpc.deploy_key
  subnet_id       = module.subnets_us-west-2a.id
  security_groups = [module.sg_web-ec2.id]
  instance_name   = "eb-wep-app-01"
  instance_type   = "t2.micro"
  public_ip       = true
  root_block_device = {
    volume_size           = "20"
    volume_type           = "standard"
    delete_on_termination = "true"
  }
}
