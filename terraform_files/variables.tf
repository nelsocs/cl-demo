variable "aws_region" {
  description = "Region for the VPC"
  default = "us-east-2"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the public subnet"
  default = "10.0.1.0/24"
}
variable "public_subnet_cidr_2" {
  description = "CIDR for the prod-nat subnet"
  default = "10.0.2.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for the monitoring subnet"
  default = "10.0.3.0/24"
}

variable "private_subnet_cidr_2" {
  description = "CIDR for the rds subnet"
  default = "10.0.4.0/24"
}

variable "ami" {
  description = "Amazon Linux AMI"
  default = "ami-USER_AMI_NUMBER_FROM_PACKER_HERE"
}

variable "key_path" {
  description = "SSH Public Key path"
  default = "/home/user/.ssh/id_rsa.pub"
}
