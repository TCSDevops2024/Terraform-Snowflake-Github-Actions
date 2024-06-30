resource "snowflake_table" "FDB_Table" {
  database = snowflake_database.FDB_Devops_2024.name
  schema = snowflake_schema.SCH_Devops_2024.name
  name = "FBD_Table"

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