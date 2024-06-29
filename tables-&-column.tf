provider "snowflake" {
  account  = var.snowflake_account
  user = var.snowflake_user
  password = var.snowflake_password
}

resource "snowflake_table" "VEHCILES_TL" {
  name     = "VECHILE_TL"
  schema   = "FDB_SCH_Devops_2024"
  database = "FDB_POC-Devops_2024"

  column {
    name = "NAME"
    type = "VARCHAR(255)"
  }

  column {
    name = "YOM"
    type = "INT"
  }

  column {
    name = "Model"
    type = "VARCHAR(20)"
  }
  column {
    name = "PRICE"
    type = "DECIMAL(10, 2)"
  }
}


