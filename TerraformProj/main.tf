provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "static_site" {
  source      = "./modules/s3-static-site"
  bucket_name = var.bucket_name
  file_path   = var.file_path
  environment = var.environment
}
