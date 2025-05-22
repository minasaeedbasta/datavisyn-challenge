terraform {
  backend "s3" {
    bucket         = "datavisyn-terraform-state"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "datavisyn-terraform-state-lock"
  }
}