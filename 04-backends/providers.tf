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

  backend "s3" {
    bucket = "cris-aian-terraform-remote-backend"
    key    = "04-backends/terraform.tfstate"
    region = "ap-southeast-1"
    use_lockfile = true
  }
}

provider "aws" {
  region = "ap-southeast-1"
}