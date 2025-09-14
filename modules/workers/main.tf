terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }
}

# This creates a cloudflare worker and on cloudflare UI allows to access settings
resource "cloudflare_worker" "worker" {
  account_id = var.account_id
  name = var.worker_name
  observability = {
    enabled = true
    head_sampling_rate = 1
    logs = {
      enabled = true
      head_sampling_rate = 1
      invocation_logs = true
    }
  }
  subdomain = {
    enabled = true
    previews_enabled = true
  }
}