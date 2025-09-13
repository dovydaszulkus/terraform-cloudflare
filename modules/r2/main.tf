terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }
}

resource "cloudflare_r2_bucket" "web_app_bucket" {
  account_id = var.account_id
  name = var.bucket_name
  location = var.location
  storage_class = var.storage_class
}