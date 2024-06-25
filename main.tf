terraform {
  required_version = ">= 1.6.6"
  required_providers {
    snowflake = {
      source  = "snowflake-labs/snowflake"
      version = "0.84.1"
    }
  }
}
