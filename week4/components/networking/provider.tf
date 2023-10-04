terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "kpa-jack-2023-state-s3-tfstate"
    key = "state/kpa-jack-2023-state-s3-tfstate-networking.tfstate"
    region = "eu-west-1"
    encrypt = true
    dynamodb_table = "terraform_state-tracker-lock"    
  }
}

provider "aws" {
    region = var.region  
}