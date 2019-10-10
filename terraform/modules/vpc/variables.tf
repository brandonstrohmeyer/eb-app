variable "vpc_cidr" {
  description = "CIDR block used to create VPC"
  default = "172.31.0.0/16"
}

variable "vpc_name" {
  description = "Name of VPC"
  default = "Unnamed"
}

variable "vpc_env" {
  description = "Environment in which VPC belongs"
  default = "None"
}

variable "aws_region" {
  description = "AWS region in which VPC is created"
  default = "us-east-1"
}

variable "key_pair_name" {
  description = "Name of keypair to be created"
}

variable "public_key" {
  description = "Public key of keypair to be created"
}
