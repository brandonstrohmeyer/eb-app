variable "name" {
  type        = string
  description = "Security Group name"
}

variable "description" {
  type        = string
  description = "Description of the SG or specific rule"
}

variable "vpc" {
  type        = map(string)
  description = "VPC to build SG in"
}

variable "rules" {
  description = "Map of values which build the complete Security Group rule"
}
