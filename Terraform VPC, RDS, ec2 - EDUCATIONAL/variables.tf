variable "aws_region" {
  default = "eu-central-1"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDR values"
  default     = ["10.0.4.0/24", "10.0.5.0/24"]
}

variable "db_subnet_cidrs" {
  type        = list(string)
  description = "DB Subnet CIDR values"
  default     = ["10.0.7.0/24", "10.0.8.0/24"]
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones"
  default     = ["eu-central-1a", "eu-central-1b"]
}

variable "ami" {
  type        = string
  description = "Ubuntu Server 20.04 LTS (HVM), SSD"
  default     = "ami-06148e0e81e5187c8"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ssh_key" {
  type    = string
  default = "your ssh key name here"
}
