terraform {
  required_providers {
    snowflake = {
      source = "Snowflake-Labs/snowflake"
      version = "0.92.0"
    }
  }
}
provider "snowflake" {
  profile = "SYS_DBA"
}
