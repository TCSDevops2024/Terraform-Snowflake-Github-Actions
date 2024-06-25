provider "snowflake" {
  account  = var.snowflake_account
  user     = var.snowflake_username
  password = var.snowflake_password
  role     = var.snowflake_role
}