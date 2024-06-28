terraform {
  required_providers {
    snowflake = {
      source = "Snowflake-Labs/snowflake"
      version = "0.92.0"
    }
  }
}
provider "snowflake" {
  account    = "rp94693.ap-south-1.aws" # required if not using profile. Can also be set via SNOWFLAKE_ACCOUNT env var
  user       = "Soumyadip" # required if not using profile or token. Can also be set via SNOWFLAKE_USER env var
}

provider "snowflake" {
  profile = "SYS_DBA"
}
resource "snowflake_database" "POC-DB" {
  name    = "DB_POC_DevOps-2024"
  comment = "Database for Snowflake Terraform demo"
}