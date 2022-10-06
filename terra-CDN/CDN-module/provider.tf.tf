terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "${var.AWS_REGION}"
}

#terraform {
 # backend "s3" {
  #  bucket         = ""
   # key            = "infrastructure/eu-central-1/terraform.tfstate"
    #region         = "eu-central-1"
  #}
#}