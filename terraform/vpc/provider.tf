provider "aws" {
  version = "~> 2.0"
  region  = var.AWS_REGION
}

terraform {
  backend "s3" {
    bucket = "terraform-deleteit"
    key    = "vpc/terraform.tfstate"
    region = "eu-west-2"
  }
}