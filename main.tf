#test
terraform {
  cloud {
    organization = "ter_mvc_api_token"

    workspaces {
      name = "FJXXVy04FAllJA.atlasv1.pwsz1jO32oK5hlsgwe3arMOD4z6JygHyZj0rl14yG9GwQITcGmWdMcIgAfgrXONV0a4"
    }
  }
}

provider "aws" {
  version = "~> 2.0"
  access_key = var.access_key
  secret_key = var.secret_key 
  region     = var.region
}

terraform {
  backend "s3" {
    #Replace this with your bucket name!
    bucket         = "tf-bucket-s3-v10"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    #Replace this with your DynamoDB table name!
//    dynamodb_table = "tf-state-lock-dynamo"
//    encrypt        = true
    }
}


# create the VPC
resource "aws_vpc" "test_VPC" {
  cidr_block           = var.vpcCIDRblock
  instance_tenancy     = var.instanceTenancy 
  enable_dns_support   = var.dnsSupport 
  enable_dns_hostnames = var.dnsHostNames
tags = {
    Name = "test_VPC"
}
} # end resource