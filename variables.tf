variable "db_admin_username" {
  type = string
  description = "(Required) The admin username for the database"
  sensitive = true
}

variable "db_admin_password" {
  type = string
  description = "(Required) The admin password for the database"
  sensitive = true
}
