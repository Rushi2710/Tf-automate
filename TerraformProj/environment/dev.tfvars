aws_region   = "us-east-1"
bucket_name  = "my-site-dev"
file_path    = "./website/dev/index.html"
environment  = "dev"


# TO RUN FOR DEV ENVIRONMENT : 

/* terraform init
terraform apply -var-file="env/dev.tfvars"  */
