terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=4.36.0, <4.47.0, !=4.43.0"
    }
  }
  required_version = "~>1.8.0"
}

provider "aws" {
  region                   = var.aws_region
  shared_credentials_files = [var.shared_credentials_files]
  profile                  = var.profile
}
