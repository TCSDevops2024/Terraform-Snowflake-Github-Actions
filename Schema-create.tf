resource "snowflake_schema" "FDB_SCH_Devops_2024" {
  database = "FDB_POC-Devops_2024"
  name     = "FDB_SCH_Devops_2024"
  comment  = "A schema."

  is_transient        = false
  is_managed          = false
  data_retention_days = 1
}