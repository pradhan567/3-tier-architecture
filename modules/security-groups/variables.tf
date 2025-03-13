variable "name" {
  description = "The name of the security group"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the security group will be created"
  type        = string
}

variable "cidr_all" {
  description = "CIDR block for all traffic"
  type        = string
}

variable "cidr_ipv4" {
  description = "CIDR block for IPv4 traffic"
  type        = string
}