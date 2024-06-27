# Reference an existing database
data "snowflake_database" "existing" {
  name = var.existing_db_name  # Replace with your existing database name or use a variable
}

# Reference an existing schema
data "snowflake_schema" "existing" {
  name     = var.existing_schema_name  # Replace with your existing schema name or use a variable
  database = data.snowflake_database.existing.name
}

# Create a new table in the existing schema
resource "snowflake_table" "new_table" {
  name      = var.new_table_name  # Replace with your new table name or use a variable
  database  = data.snowflake_database.existing.name
  schema    = data.snowflake_schema.existing.name

  column {
    name = "ID"
    type = "NUMBER"
  }

  column {
    name = "NAME"
    type = "STRING"
  }
}