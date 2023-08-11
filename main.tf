terraform {
  required_version = "~> 1.0" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
# Provider Block
provider "aws" {
  region = "us-east-1"
}
resource "aws_vpc" "tactions" {
  cidr_block = "10.0.0.0/16"


  tags = {
    Name = "myvpc"
    Team = "Devops"
    Environment = "prod"
  }
}
