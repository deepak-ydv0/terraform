terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.91.0"
    }
  }

  backend "s3" {
    bucket         = "TWS-Jnoon-dynamodb-table"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "TWS-Jnoon-dynamodb-table"
  }
}
