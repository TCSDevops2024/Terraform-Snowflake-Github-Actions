provider "snowflake" {
       account  = var.snowflake_account
       user     = var.snowflake_user
       password = var.snowflake_password
     }

     resource "snowflake_database" "FDB_Devops_2024" {
       name                        = "FDB_Devops_2024"
       comment                     = "New DB creation"
       data_retention_time_in_days = 4
     }