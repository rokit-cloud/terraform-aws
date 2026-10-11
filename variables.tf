variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "azs" {
  type    = list(string)
  default = ["ap-south-1a", "ap-south-1b"]
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "ami_id" {
  type        = string
  description = "Optional Amazon Linux 2023 AMI ID"
  default     = ""
}

variable "ssh_cidr" {
  type        = string
  description = "Your public IP in CIDR format; empty disables SSH"
  default     = ""

  validation {
    condition     = var.ssh_cidr == "" || (can(cidrhost(var.ssh_cidr, 0)) && var.ssh_cidr != "0.0.0.0/0")
    error_message = "ssh_cidr must be empty or a valid CIDR such as 1.2.3.4/32."
  }
}
