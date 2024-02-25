resource "aws_s3_bucket" "this" {
  count  = var.enable_create_s3_bucket ? 1 : 0
  bucket = var.bucket_env_name
  tags   = var.tags
}