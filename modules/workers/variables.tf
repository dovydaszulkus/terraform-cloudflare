variable "account_id" {
  type        = string
  description = "Cloudflare Account ID"
  sensitive   = true
}

variable "worker_name" {
  type        = string
  description = "Name of the Cloudflare Worker"
  default     = "web-app-worker"
}