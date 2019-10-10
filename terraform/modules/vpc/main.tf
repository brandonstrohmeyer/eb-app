# Get account ID for output.
data "aws_caller_identity" "current" {
}

# Build AWS VPC with provided CIDR block and tag values.
resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
   
  tags = {
    Name        = var.vpc_name
    Environment = var.vpc_env
  }
}

# Build IGW on VPC creation
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "igw-${var.vpc_name}"
  }
}

# Calling this resource with no additional parameters 
# serves to delete all rules that initilize with the 
# default security group.
resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.this.id
}

# Create a key pair used to deploy EC2 instances.
resource "aws_key_pair" "deploy" {
  key_name   = var.key_pair_name
  public_key = var.public_key
}

# Get current AWS region.
data "aws_region" "current" {
}
