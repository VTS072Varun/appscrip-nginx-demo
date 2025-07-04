terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.40.0"  # Explicitly set to a known stable version
    }
  }
}

provider "aws" {
  region = var.region
}
