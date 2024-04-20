terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=4.36.0, <4.47.0, !=4.43.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.1"
    }
  }
  required_version = "~>1.8.0"
}

provider "aws" {
  region = "eu-west-3"
  default_tags {
    tags = var.tags
  }
}


