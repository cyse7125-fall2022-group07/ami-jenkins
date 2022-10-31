variable "AWS_ACCESS_KEY" {
  type    = string
  default = ""
}

variable "AWS_SECRET_ACCESS" {
  type    = string
  default = ""
}

variable "aws_region" {
  type    = string
  default = ""
}

variable "source_ami" {
  type    = string
  default = ""
}

variable "ssh_username" {
  type    = string
  default = ""
}

variable "ami_users" {
  type    = list(string)
  default = ""
}

locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

source "amazon-ebs" "ubuntu" {
  access_key      = "${var.AWS_ACCESS_KEY}"
  ami_description = "Ubuntu AMI for csye7125"
  ami_name        = "csye7125_${local.timestamp}"
  instance_type   = "t2.micro"
  profile         = "default"
  region          = "${var.aws_region}"
  secret_key      = "${var.AWS_SECRET_ACCESS}"
  source_ami      = "${var.source_ami}"
  ssh_username    = "${var.ssh_username}"
  ami_users       = "${var.ami_users}"
  ami_block_device_mappings {
  delete_on_termination = true
  device_name           = "/dev/xvda"
  volume_size           = 60
  volume_type           = "gp2"
  }
}

build {
  sources = ["source.amazon-ebs.ubuntu"]

  provisioner "shell" {
    script = "buildscript.sh"
  }
}