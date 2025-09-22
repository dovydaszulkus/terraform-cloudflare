terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }
}

resource "cloudflare_queue" "queue" {
  account_id = var.account_id
  queue_name = var.queue_name
}