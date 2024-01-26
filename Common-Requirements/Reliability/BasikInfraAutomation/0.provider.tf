variable "cluster_name" {
  default = "basik-eks-cluster"
}

provider "aws" {
  region = "ap-south-1"
}

terraform {
  required_version = "~> 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.6"
    }
  }
}

terraform {
  backend "s3" {
    bucket         = "basik-eks-state-bucket"
    dynamodb_table = "terraform-state"
    key            = "terraform-aws-eks-env.tfstate"
    region         = "ap-south-1"
    encrypt        = true
  }
}