variable "vpc" {
  type        = map(string)
  description = "Map of VPC details"
}

variable "subnet_az" {
  type        = string
  description = "AZ to deploy subnets"
}

variable "subnet_name" {
  type        = string
  description = "Name of AWS Subnet"
}

variable "subnet_cidr" {
  type        = string
  description = "CIDR block for AWS Subnet"
}

