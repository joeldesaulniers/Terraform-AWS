# This is my main tf file that is deploying config based on a TF module.

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region  = "ca-central-1"
}

resource "aws_iam_instance_profile" "ssm_profile" {
  name = "ssm_profile"
  role = "EC2-SSM"
}

resource "aws_instance" "example" {
  ami 			= "ami-020caff809d5a5307"
  instance_type = "t3.nano"
  iam_instance_profile = "${aws_iam_instance_profile.test_profile.name}"
} 
