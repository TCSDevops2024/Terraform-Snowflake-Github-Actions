resource "snowflake_schema" "SCH_Devops_2024" {
       database = snowflake_database.FDB_Devops_2024.name
       name     = "FDB_SCH_Devops_2024"
       comment  = "A schema."
       is_transient        = false
       is_managed          = false
       data_retention_days = 4
     }