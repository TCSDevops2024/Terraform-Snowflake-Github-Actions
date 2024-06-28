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
  user = "Soumyadip"
  password = "Devops@2024"
}

resource "snowflake_schema" "schema" {
  database = "DB_POC_DevOps-2024"
  name     = "SCH-POC-DevOps-2024"
  comment  = "A schema"

  is_transient        = false
  is_managed          = false
  data_retention_days = 1
}

