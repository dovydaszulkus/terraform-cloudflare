variable "cloudflare_api_token" {
  type        = string
  description = "API token for Cloudflare"
  sensitive   = true
}

variable "account_id" {
  type        = string
  description = "Cloudflare Account ID"
}

