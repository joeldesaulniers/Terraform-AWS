# This is the main TF file that is deploying config based on a TF module.

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  backend "remote" {
    organization = "joelcorp"

    workspaces {
      name = "joel-workspace"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "ca-central-1"
}

module "notify_slack" {
  source  = "terraform-aws-modules/notify-slack/aws"
  version = "~> 4.0"

  sns_topic_name = "slack-topic"

  slack_webhook_url = "https://hooks.slack.com/services/AAA/BBB/CCC"
  slack_channel     = "aws-notification"
  slack_username    = "reporter"
}