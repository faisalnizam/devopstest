// Module specific variables
variable "name" {
	default = "devops_rds_sg"
}

variable "environment" {
  default = "test"
}

variable "vpc_id" {
  description = "The VPC this security group will go in"
}

variable "security_group_id" {
  description = "The source CIDR block to allow traffic from"
}
