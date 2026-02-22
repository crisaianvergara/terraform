terraform {
  required_version = "~> 1.14"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

provider "aws" {
  region = "eu-west-2"
  alias  = "eu-west"
}

resource "aws_s3_bucket" "my_bucket_south" {
  bucket = "my-bucket-south1111111-11"
}

resource "aws_s3_bucket" "my_bucket_west" {
  bucket   = "my-bucket-north1111111-12"
  provider = aws.eu-west
}