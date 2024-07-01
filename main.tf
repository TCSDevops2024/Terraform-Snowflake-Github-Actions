resource "snowflake_database" "FDB_Devops_2024" {
       name                        = "FDB_Devops_2024"
       comment                     = "New DB creation"
       data_retention_time_in_days = 4
     }

