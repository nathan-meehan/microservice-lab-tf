terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

module "table" {
 source = "./table" 
}

module "lambda" {
  source    = "./lambda"
  file_name = "./lambda-config.zip"
  credentials = ""
}

module "api-gateway" {
  source     = "./api-gateway"
  lambda_uri = module.lambda.lambda_uri
  credentials = ""
}