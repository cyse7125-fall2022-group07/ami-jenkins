variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "source_ami" {
  type    = string
  default = "ami-052efd3df9dad4825"
}

variable "ssh_username" {
  type    = string
  default = "ubuntu"
}

variable "ami_users" {
  type    = list(string)
  default = ["328312601153", "657457564447"]
}