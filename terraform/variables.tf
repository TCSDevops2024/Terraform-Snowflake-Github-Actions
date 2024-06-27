variable "snowflake_user" {}
variable "snowflake_password" {}
variable "snowflake_account" {}
variable "existing_db_name" {
  default = "FDB_MNG_TRANSFORM_LYR"  # Replace with your existing database name
}
variable "existing_schema_name" {
  default = "SCH_MNG_TL"  # Replace with your existing schema name
}
variable "new_table_name" {
  default = "METRICS_T4"  # Replace with your new table name
}