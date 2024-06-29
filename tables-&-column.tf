resource "snowflake_table_column" "FDB_POC_TL_NAME" {
  table_name    = "FDB_POC_TL"
  database_name = "FDB_POC-Devops_2024"
  schema_name   = "FDB_SCH_Devops_2024"

  column {
    name     = "NAME"
    type     = "VARCHAR(255)"
    comment  = "Name of the item"
    nullable = true
  }
}

resource "snowflake_table_column" "FDB_POC_TL_YOM" {
  table_name    = "FDB_POC_TL"
  database_name = "FDB_POC-Devops_2024"
  schema_name   = "FDB_SCH_Devops_2024"

  column {
    name     = "YOM"
    type     = "INT"
    comment  = "Year of manufacture"
    nullable = true
  }
}

resource "snowflake_table_column" "FDB_POC_TL_Model" {
  table_name    = "FDB_POC_TL"
  database_name = "FDB_POC-Devops_2024"
  schema_name   = "FDB_SCH_Devops_2024"

  column {
    name     = "Model"
    type     = "VARCHAR(20)"
    comment  = "Model of the item"
    nullable = true
  }
}

resource "snowflake_table_column" "FDB_POC_TL_PRICE" {
  table_name    = "FDB_POC_TL"
  database_name = "FDB_POC-Devops_2024"
  schema_name   = "FDB_SCH_Devops_2024"

  column {
    name     = "PRICE"
    type     = "DECIMAL(10, 2)"
    comment  = "Price of the item"
    nullable = true
  }
}


