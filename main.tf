provider "aws" {
  region = "ap-southeast-2" # Sydney
}

resource "aws_s3_bucket" "archive" {
  bucket = "joshua-personal-deep-archive"
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.archive.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encrypt" {
  bucket = aws_s3_bucket.archive.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "lifecycle" {
  bucket = aws_s3_bucket.archive.id

  rule {
    id     = "move-to-deep-archive"
    status = "Enabled"

    transition {
      days = 0
      storage_class = "DEEP_ARCHIVE"
    }

    noncurrent_version_transition {
      noncurrent_days = 0
      storage_class = "DEEP_ARCHIVE"
    }
  }
}