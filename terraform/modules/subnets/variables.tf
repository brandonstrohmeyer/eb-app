variable "vpc" {
    description = "Map of VPC details"
}

variable "subnet_az" {
    description = "AZ to deploy subnets"
}

variable "public" {
  description = "Public subnet details for AZ"
}

variable "private" {
  description = "List of additional private subnets for AZ"
}
