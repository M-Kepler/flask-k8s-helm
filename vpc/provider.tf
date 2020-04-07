provider "aws" {
  version = "~> 2.0"
  region  = var.AWS_REGION
}

terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}