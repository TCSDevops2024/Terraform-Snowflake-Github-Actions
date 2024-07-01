resource "snowflake_column" "new-demo-column" {
  table_name = "snowflake_table.FDB_Table"
  name = "DISTANCE_COVERS"
  data_type = "DECIMAL"
  autoincrement = true
  start_value = 1
  increment_by = 1
}