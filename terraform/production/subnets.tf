// Build subnets in us-west-2
module "subnets_us-west-2a" {
  source      = "../modules/public-subnet"
  vpc         = module.vpc
  subnet_az   = "us-west-2a"
  subnet_name = "usw2a-public"
  subnet_cidr = "10.144.1.0/24"
}

module "subnets_us-west-2b" {
  source      = "../modules/public-subnet"
  vpc         = module.vpc
  subnet_az   = "us-west-2b"
  subnet_name = "usw2b-public"
  subnet_cidr = "10.144.2.0/24"
}
