terraform {
  backend "s3" {
    bucket = "terraformstate-store"
    key    = "state/snowflake.tfstate"
    region = "ap-south-1"
    access_key     = var.aws_access_key
    secret_key     = var.aws_secret_key
  }
}