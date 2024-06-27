terraform {
  required_providers {
    snowflake = {
      source = "Snowflake-Labs/snowflake"
      version = "0.92.0"
    }
  }
}
provider "snowflake" {
  user = var.snowflake_user
  password = var.snowflake_password
  account  = var.snowflake_account
}