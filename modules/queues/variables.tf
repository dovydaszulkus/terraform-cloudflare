variable "account_id" {
  type        = string
  description = "Cloudflare Account ID"
  sensitive   = true
}

variable "queue_name" {
  type        = string
  description = "Name of the Cloudflare Queue"
}

