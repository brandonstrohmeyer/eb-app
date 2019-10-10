module "vpc" {
  source     = "https://github.com/brandonstrohmeyer/lemony.git//terraform/modules/vpc"
  vpc_name   = "lemony"
  vpc_cidr   = "10.144.0.0/16"
  vpc_env    = "production"
  aws_region = "us-east-1"
  key_pair_name = "deploy-key"
  public_key    = var.public_key
}
