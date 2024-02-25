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

resource "aws_s3_bucket_object" "object" {
  count                  = var.enable_create_s3_bucket ? 1 : 0
  bucket                 = var.bucket_env_name
  key                    = "${var.path_env_name}/${var.file_env_name}.env"
  source                 = "${var.file_env_name}.env"
  server_side_encryption = "AES256"

  depends_on = [aws_s3_bucket.this]
}