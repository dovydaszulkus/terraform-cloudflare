module "web_app_bucket" {
  source = "../../modules/r2"
  
  account_id = var.account_id
  bucket_name = "web-app-assets-dev"
}

module "web_app_worker" {
  source = "../../modules/workers"
  
  account_id = var.account_id
  worker_name = "web-app-worker-dev"
}