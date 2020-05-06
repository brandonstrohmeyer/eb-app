variable "name" {
  type        = string
  description = "Load balancer name"
}

variable "description" {
  type        = string
  description = "Description of the ALB"
}

variable "listener" {
  description = "Listener to create"
}

variable "security_groups" {
  type        = list(string)
  description = "List of SGs to attach to load balancer"
  default     = []
}

variable "subnets" {
  type        = list(string)
  description = "Subnets to deploy load balancer listeners in"
  default     = []
}

variable "target_group" {
  description = "Target group to create"
}

variable "vpc" {
  description = "Map of VPC details"
}
