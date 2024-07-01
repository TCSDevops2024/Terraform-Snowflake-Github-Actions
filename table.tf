resource "snowflake_table" "FDB_Table" {
       database                    = snowflake_database.FDB_Devops_2024.name
       schema                      = snowflake_schema.SCH_Devops_2024.name
       name                        = "FDB_Table"
       comment                     = "A table."
       data_retention_time_in_days = 3
       change_tracking             = false

       column {
         name     = "VEHICLE_NAME"
         type     = "VARCHAR"
         nullable = true
       }
       column {
         name     = "VEHICLE_IDENTITY"
         type     = "NUMBER(38,0)"
         nullable = true
       }
       column {
         name     = "VEHICLE_MODEL"
         type     = "VARCHAR"
         nullable = true
       }

    # New column to be added column 
    column {
     name = "DISTANCE_COVERS" 
     type = "DECIMAL (10 ,8 )"
     nullable = true
    }   
}      