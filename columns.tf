resource "snowflake_table_column" "FBD-column" {
  table    = "FDB_Table"
  schema   = "FDB_SCH_Devops_2024"
  database = "FDB_Devops_2024"

  column {
    name     = "OWNER_NAME"
    type     = "VARCHAR(255)"
    nullable = true
  }

  column {
    name     = "OWNER_PINCODE"
    type     = "NUMBER(38,0)"
    nullable = true
  }
}
