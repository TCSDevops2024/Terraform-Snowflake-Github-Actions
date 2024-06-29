resource "snowflake_table_column" "FDB_POC_TL_New_Column" {
  table_name    = "FDB_POC_TL"
  database_name = "FDB_POC-Devops_2024"
  schema_name   = "FDB_SCH_Devops_2024"

  column {
    name     = "Distance-covers"
    type     = "DECIMAL(10 ,2)"
    comment  = "Description of the new column"
    nullable = true
  }
}