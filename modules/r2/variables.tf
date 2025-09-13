variable "account_id" {
  type        = string
  description = "Cloudflare Account ID"
  sensitive   = true
}

variable "bucket_name" {
  type        = string
  description = "Name of the R2 bucket"
}

variable "location" {
  type        = string
  description = "Location/region of the R2 bucket"
  default     = "weur"
}

variable "storage_class" {
  type        = string
  description = "Storage class for the R2 bucket"
  default     = "Standard"
  validation {
    condition     = contains(["Standard"], var.storage_class)
    error_message = "Storage class must be 'Standard'."
  }
}

