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
  
  variable "subnet_id" {
    type    = string
    default = "subnet-07dd8a0f3d1af60ff"
  }
  

  locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }
  source "amazon-ebs" "ubuntu" {
    access_key      = "${var.AWS_ACCESS_KEY}"
    ami_description = "Ubuntu AMI for csye7125"
    ami_name        = "csye7125_${local.timestamp}"
    instance_type   = "t2.micro"
    profile         = "dev"
    region          = "${var.aws_region}"
    secret_key      = "${var.AWS_SECRET_ACCESS}"
    source_ami      = "${var.source_ami}"
    ssh_username    = "${var.ssh_username}"
    subnet_id       = "${var.subnet_id}"
  }
  
  build {
    sources = ["source.amazon-ebs.ubuntu"]
  
    provisioner "shell" {
      inline = ["echo Hello world!"]
    }
  
  }