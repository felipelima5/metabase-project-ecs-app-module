resource "aws_s3_bucket" "this" {
  count  = var.enable_create_s3_bucket ? 1 : 0
  bucket = var.bucket_env_name
  tags   = var.tags
}

resource "aws_s3_bucket_versioning" "this" {
  count  = var.enable_create_s3_bucket ? 1 : 0
  bucket = aws_s3_bucket.this[0].id
  versioning_configuration {
    status = var.enable_versioning_configuration
  }
}