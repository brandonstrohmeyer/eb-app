output "build_vpc" {
  description = "Build VPC ID"
  value       = module.vpc.vpc_id
}

output "build_subnet" {
  description = "Build Subnet ID"
  value       = module.subnets_us-west-2a.id
}

