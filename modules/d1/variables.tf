variable "account_id" {
  type        = string
  description = "Cloudflare Account ID"
  sensitive   = true
}

variable "database_name" {
  type        = string
  description = "Name of the D1 database"
}

variable "location" {
  type        = string
  description = "Location/region of the D1 database"
  default     = "weur"
}
