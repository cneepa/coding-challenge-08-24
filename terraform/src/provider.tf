provider "aws" {
  region = "ap-southeast-2"
}

terraform {
  required_version = ">=1.9.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.63.0"
    }
  }
}