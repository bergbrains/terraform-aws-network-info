terraform {
  required_version = "1.9.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      # version = "5.69.0"
      version = "~> 5.0"
    }
  }
}
