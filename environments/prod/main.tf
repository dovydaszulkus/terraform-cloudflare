module "web_app_bucket" {
  source = "../../modules/r2"

  account_id  = var.account_id
  bucket_name = "web-app-assets-prod"
}

module "web_app_worker" {
  source = "../../modules/workers"

  account_id  = var.account_id
  worker_name = "web-app-worker-prod"
}

module "web_app_database" {
  source = "../../modules/d1"

  account_id    = var.account_id
  database_name = "web_app_db_prod"
}

module "web_app_queue" {
  source = "../../modules/queues"

  account_id = var.account_id
  queue_name = "web-app-queue-prod"
  
}