provider "snowflake" {
  account  = var.snowflake_account
  user     = var.snowflake_user
  password = var.snowflake_password
}

resource "snowflake_database" "FDB_Devops_2024" {
  name                        = "FDB_Devops_2024"
  comment                     = "New DB creation"
  data_retention_time_in_days = 3
}

resource "snowflake_schema" "SCH_Devops_2024" {
  database = snowflake_database.FDB_Devops_2024.name
  name     = "FDB_SCH_Devops_2024"
  comment  = "A schema."
  is_transient        = false
  is_managed          = false
  data_retention_days = 3
}

resource "snowflake_table" "FDB_Table" {
  database                    = snowflake_database.FDB_Devops_2024.name
  schema                      = snowflake_schema.SCH_Devops_2024.name
  name                        = "FDB_Table"
  comment                     = "A table."
  data_retention_time_in_days = 3
  change_tracking             = false

  column {
    name     = "VECHILE_NAME"
    type     = "VARCHAR"
    nullable = true
  }

  column {
    name     = "VECHILE_IDENTITY"
    type     = "NUMBER(38,0)"
    nullable = true
  }

  column {
    name     = "VECHILE_MODEL"
    type     = "VARCHAR"
    nullable = true
  }

  column {
    name     = "OWNER_FIRST_NAME"
    type     = "VARCHAR(255)"
    nullable = true
  }

}