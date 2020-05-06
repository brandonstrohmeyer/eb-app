variable "ami_id" {
  type        = string
  description = "Resource ID for desired AMI"
  default     = ""
}

variable "keypair" {
  type        = string
  description = "SSH keypair to use"
  default     = null
}

variable "subnet_id" {
  type        = string
  description = "Subnet to build the host"
  default     = ""
}

variable "security_groups" {
  type        = list
  description = "SGs to attach to host"
  default     = null
}

variable "instance_name" {
  type        = string
  description = "Name of ec2 instance"
  default     = "noname"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "noname"
}

variable "public_ip" {
  type        = bool
  description = "Associate public IP with instance"
  default     = false
}

variable "root_block_device" {
  description = "Instance root block device"
  default     = null
}
