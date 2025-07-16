output "website_endpoint" {
  description = "The S3 static website endpoint"
  value       = aws_s3_bucket.s3.website_endpoint
}
