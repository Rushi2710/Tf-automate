aws_region   = "us-east-2"
bucket_name  = "my-site-preprod"
file_path    = "./website/preprod/index.html"
environment  = "preprod"


# TO RUN FOR PREPROD ENVIRONMENT:
// terraform init 
/*terraform apply -var-file="env/preprod.tfvars"
*/