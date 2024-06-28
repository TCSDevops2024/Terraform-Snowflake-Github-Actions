terraform {
  required_providers {
    snowflake = {
      source = "Snowflake-Labs/snowflake"
      version = "0.92.0"
    }
  }
}
provider "snowflake" {
  account = "rp94693.ap-south-1.aws"
}

resource "snowflake_database" "POC-DB" {
  name    = "DB_POC_DevOps"
  comment = "Database for Snowflake Terraform demo"
}