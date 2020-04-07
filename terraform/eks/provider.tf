provider "aws" {
  version = "~> 2.0"
  region  = var.AWS_REGION
}

terraform {
  backend "s3" {
    bucket = "terraform-states"
    key    = "eks/terraform.tfstate"
    region = "eu-west-2"
  }
}


data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "terraform-states"
    key    = "vpc/terraform.tfstate"
    region = "eu-west-2"
  }
}