resource "snowflake_table_column" "new_columns" {
  table      = "FDB_Table"
  schema     = "FDB_SCH_Devops_2024"
  database   = "FDB_Devops_2024"

  column {
    name     = "OWNER_FIRST_NAME"
    type     = "VARCHAR(255)"
    nullable = true
  }

  column {
    name     = "OWNER_LAST_NAME"
    type     = "VARCHAR(255)"
    nullable = true
  }

  column {
    name     = "OWNER_PINCODE"
    type     = "NUMBER(38,0)"
    nullable = true
  }
}
