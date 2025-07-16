# Creates an S3 bucket with a name provided from a variable bucket_name.
resource "aws_s3_bucket" "s3" {
  bucket = var.bucket_name
  tags = {
    Environment = var.environment
  }
}

# This disables all restrictions on public access, alllowing objects in the bucket to be accessed publicly.
resource "aws_s3_bucket_public_access_block" "s3-public-block" {
  bucket = aws_s3_bucket.s3.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Ensures that you (bucket owner) get owneership of uploaded objects, even if someone else (like another AWS account) uploads them.
resource "aws_s3_bucket_ownership_controls" "s3-ownership" {
  bucket = aws_s3_bucket.s3.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# public-read" allows the public to read files in the bucket 
resource "aws_s3_bucket_acl" "s3-acl" {
  bucket = aws_s3_bucket.s3.id
  acl    = "public-read"
}

/*Uploads the file from your local machine (var.file_path, e.g. ./website/index.html) to the S3 bucket.

The key "index.html" means that this will be the fillename in S3.

ACL is set to public-read so it’s publicly accessible.

Content type text/html ensures it's treated as a web page.*/

resource "aws_s3_object" "s3-object" {
  bucket       = aws_s3_bucket.s3.id
  key          = "index.html"
  source       = var.file_path
  content_type = "text/html"
  acl          = "public-read"
}

/*Configures the bucket to act as a static website.

It sets "index.html" as the default page when someone visits the root of the site.

*/
resource "aws_s3_bucket_website_configuration" "s3-website" {
  bucket = aws_s3_bucket.s3.id

  index_document {
    suffix = "index.html"
  }
}
