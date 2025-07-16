variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket"
}

variable "file_path" {
  type        = string
  description = "Path to the index.html file"
}

variable "environment" {
  type = string
}