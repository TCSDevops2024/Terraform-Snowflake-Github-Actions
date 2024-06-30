resource "snowflake_table_column" "new_columns" {
  table  = snowflake_table.FDB_Table.name
  schema = snowflake_schema.SCH_Devops_2024.name
  database = snowflake_database.FDB_Devops_2024.name

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
  