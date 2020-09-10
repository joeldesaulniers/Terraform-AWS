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

resource "aws_instance" "example" {
  ami 			= "ami-020caff809d5a5307"
  instance_type = "t3.micro"
} 
