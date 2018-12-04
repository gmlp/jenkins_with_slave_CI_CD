provider "aws" {
  region = "us-east-1"
}
terraform {
  backend "s3" {
    bucket = "tf-remote-state-training-nov"
    key = "jenkins_with_slave_CI_CD/stack_deployer/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "main" {
  backend = "s3"

  config {
    bucket = "tf-remote-state-training-nov"
    key = "jenkins_with_slave_CI_CD/terraform.tfstate"
    region = "us-east-1"
  }
}