resource "snowflake_schema" "DEMO-SCHEMA" {
  database = "DB_POC_DevOps-2024"
  name     = "SCH-POC-DevOps-2024"
  comment  = "A schema"

  is_transient        = false
  is_managed          = false
  data_retention_days = 1
}