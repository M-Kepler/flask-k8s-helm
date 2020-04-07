## Provider
provider "aws" {
  version = "~> 2.0"
  region  = "eu-west-2"
}

## S3 Bucket
resource "aws_s3_bucket" "backend_storage" {
  bucket = "terraform-deleteit"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}