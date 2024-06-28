terraform {
  required_providers {
    snowflake = {
      source = "Snowflake-Labs/snowflake"
      version = "0.92.0"
    }
  }
}
provider "snowflake" {
  account = "var.snowflake_account"
  password = "var.snowflake_password"
  user = "var.snowflake_user"

}

