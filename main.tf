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
    name     = "CONTACT_NO"
    type     = "INT"
    nullable = true
  }
  
}  