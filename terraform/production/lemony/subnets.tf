# Create public and private subnets in the VPC. A single AZ is required here, but
# for each additional AZ a seperate module definition would be required.

module "subnets_us-east-1a" {
  source      = "https://github.com/brandonstrohmeyer/lemony.git//terraform/modules/subnets"
  vpc         = module.vpc
  subnet_az   = "us-east-1a"

  public = {
      subnet_name = "use1a_public"
      subnet_cidr = "10.144.1.0/24"
  }

  private = []
}
