terraform {
  backend "s3" {
    bucket = "terraformstate-store"
    key    = "state/snowflake.tfstate"
    region = "ap-south-1"

  }
}