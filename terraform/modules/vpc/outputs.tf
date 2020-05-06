output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.this.id
}

output "igw_id" {
  description = "Internet Gateway ID"
  value       = aws_internet_gateway.igw.id
}

output "deploy_key" {
  description = "Default EC2 SSH Key"
  value       = aws_key_pair.deploy.key_name
}
