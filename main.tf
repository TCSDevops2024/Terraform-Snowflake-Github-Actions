resource "snowflake_schema" "DEMO-SCHEMA" {
  database = "DB_POC_DevOps-2024"
  name     = "SCH_POC"
  comment  = "A schema."

  is_transient        = false
  is_managed          = false
  data_retention_days = 1
}
resource "snowflake_schema" "schema" {
  database            = "database"
  name                = "schema"
  data_retention_days = 1
}

resource "snowflake_sequence" "DEMO_sequence" {
  database = snowflake_schema.schema.database
  schema   = snowflake_schema.schema.name
  name     = "POC-Schema"
}

resource "snowflake_table" "DEMO-TABLE" {
  database                    = snowflake_schema.schema.database
  schema                      = snowflake_schema.schema.name
  name                        = "POC_TL"
  comment                     = "Test table."
  change_tracking             = false

  column {
    name     = "FIRST_NAME"
    type     = "VAR"
    nullable = true

    default {
      sequence = snowflake_sequence.DEMO_sequence.fully_qualified_name
    }
  }

  column {
    name     = "LAST_NAME"
    type     = "VAR"
    nullable = true
  }
  column {
    name     = "CONTACT_NUMBER"
    type     = "INT"
    nullable = true
  }
}  