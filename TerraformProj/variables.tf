variable "aws_region" {
  default     = "us-east-1"
  description = "AWS region"
}

variable "aws_access_key" {
  description = "AWS access key"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
  sensitive   = true
}

variable "bucket_name" {
  description = "Bucket name for static website"
  default     = "1027-bucks"
}

variable "file_path" {
  description = "Path to index.html"
  default     = "website-files/index.html"
}

variable "environment" {
  type = string
}