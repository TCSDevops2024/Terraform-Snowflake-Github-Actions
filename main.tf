resource "snowflake_database" "FDB_Devops_2024" {
  name                        = "FDB_Devops_2024"
  comment                     = "New DB creation"
  data_retention_time_in_days = 3
}
resource "snowflake_schema" "SCH_Devops_2024" {
  database = "FDB_Devops_2024"
  name     = "FDB_SCH_Devops_2024"
  comment  = "A schema."

  is_transient        = false
  is_managed          = false
  data_retention_days = 1
}

resource "snowflake_table" "FDB_Table" {
  database                    = snowflake_schema.schema.database
  schema                      = snowflake_schema.schema.name
  name                        = "FDB_Table"
  comment                     = "A table."
  data_retention_time_in_days = snowflake_schema.schema.data_retention_time_in_days
  change_tracking             = false

  column {
    name     = "VECHILE_NAME"
    type     = "VARCHAR"
    nullable = true
  }
  column {
    name     = "VECHILE IDENTITY"
    type     = "NUMBER(38,0)"
    nullable = true

  }
  column {
    name     = "VECHILE_MODEL"
    type     = "VARCHAR"
    nullable = true
    }
}
    