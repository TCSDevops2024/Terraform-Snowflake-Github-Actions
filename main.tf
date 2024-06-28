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

resource "snowflake_database" "POC-DB" {
  name    = "DB_POC_DevOps-2024"
  comment = "Database for Snowflake Terraform demo"
}
resource "snowflake_schema" "schema" {
  database = "DB_POC_DevOps-2024"
  name     = "SCH-POC-DevOps-2024"
  comment  = "A schema"

  is_transient        = false
  is_managed          = false
  data_retention_days = 1
}

resource "snowflake_dynamic_table" "dt" {
  name     = "METRICS_T4"
  database = "DB_POC_DevOps-2024"
  schema   = "SCH-POC-DevOps-2024"
  target_lag {
    maximum_duration = "20 minutes"
  }
  warehouse = "WH_FOR_ADMINS"
  query     = "CREATE TABLE METRICS_T4 (FIRST NAME VARCHAR, LAST NAME VARCHAR, CONTACT NUMBER,)"
  comment   = "sample warehouse "
}