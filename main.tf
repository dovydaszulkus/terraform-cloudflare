module "web_app_bucket" {
  source = "./modules/r2"
  
  account_id = var.account_id
  bucket_name = "web-app-assets"
}