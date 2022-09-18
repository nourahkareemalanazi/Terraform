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

  access_key = "AccesskeyID"
  secret_key = "Secretaccesskey"
  region = "us-east-1"

}
