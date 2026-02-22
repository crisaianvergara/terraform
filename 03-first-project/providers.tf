terraform {
  required_version = "~> 1.14.0"

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.8.1"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.32.1"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}