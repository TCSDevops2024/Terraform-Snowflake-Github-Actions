resource "snowflake_table" "POC_TL" {
  name     = "POC_TL"
  schema   = "SCH_POC"
  database = "DB_POC_DevOps-2024"

  column {
    name = "First_name"
    type = "VARCHAR(255)"
  }

  column {
    name = "Last_name"
    type = "VARCHAR(255)"
  }

  column {
    name = "Contact_no"
    type = "VARCHAR(20)"
  }
}