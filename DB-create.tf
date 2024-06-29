resource "snowflake_database" "FDB_POC-Devops_2024" {
  name                        = "FDB_POC-Devops_2024"
  comment                     = "New DB creation"
  data_retention_time_in_days = 3
}
