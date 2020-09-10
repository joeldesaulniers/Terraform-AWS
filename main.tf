# This is my main tf file that is deploying config based on a TF module.

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "ca-central-1"
}

resource "aws_instance" "example" {
  ami 			= "ami-020caff809d5a5307"
  instance_type = "t3.micro"
} 
/*
module "notify_slack" {
  source  = "terraform-aws-modules/notify-slack/aws"
  version = "~> 4.0"

  sns_topic_name = "slack-topic"

  slack_webhook_url = "https://hooks.slack.com/services/AAA/BBB/CCC"
  slack_channel     = "aws-notification"
  slack_username    = "reporter"
}
*/