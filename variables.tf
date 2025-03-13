variable "my_vpc" {
    description = "This is the CIDR block for my VPC"
    type        = string
}

variable "public-sub-1" {
    description = "This is the CIDR block for my subnet"
    type        = string
}

variable "public-sub-2" {
    description = "This is the CIDR block for my subnet"
    type        = string
}

variable "private-sub-1" {
    description = "This is the CIDR block for my subnet"
    type        = string
}

variable "private-sub-2" {
    description = "This is the CIDR block for my subnet"
    type        = string
}

variable "availability-zone" {
    description = "Availability zone for the subnet"
    type        = string
}

variable "availability-zone1" {
    description = "Availability zone for the subnet"
    type        = string
}

variable "cidr_all" {
    description = "CIDR block allowed for all"
    type        = string
}

variable "ubuntu_ami" {
    description = "This is value for ubuntu ami"
    type        = string
}

variable "instance_type_medium" {
    description = "This is value for instance type medium"
    type        = string
}