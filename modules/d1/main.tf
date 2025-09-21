terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }
}

resource "cloudflare_d1_database" "example_d1_database" {
  account_id = var.account_id
  name = var.database_name
  primary_location_hint = var.location
}