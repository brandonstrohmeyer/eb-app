output "vpc_name" {
  value = "${var.vpc_name}"
}

output "vpc_cidr" {
  value = "${var.vpc_cidr}"
}

output "vpc_id" {
  value = "${aws_vpc.this.id}"
}

output "vpc_env" {
  value = "${var.vpc_env}"
}

output "aws_region" {
  value = "${data.aws_region.current.name}"
}

output "igw_id" {
  value = "${aws_internet_gateway.igw.id}"
}

output "default_security_group_id" {
  value = "${aws_default_security_group.default.id}"
}

output "account_id" {
  value = "${data.aws_caller_identity.current.account_id}"
}

output "deploy_key" {
  value = "${aws_key_pair.deploy.key_name}"
}
