terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "s3monitorobject"
    key    = "state.tf"
    region = "us-east-1"
  }
}


# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "Server-1" {
     ami = "${var.ami}"
     availability_zone = "${var.az}"
     instance_type = "${var.instance_type}"
     key_name = "${var.key_pair}"
     tags = {
         Name = "Server-1"
         Env = "Test"
     }
lifecycle {
    create_before_destroy = true
  }
}


