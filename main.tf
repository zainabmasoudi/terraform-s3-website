# Creating S3 Bucket 
# Terraform internal name: mybucket and aws dosen't see this name. 
# the actual name is the bucketname
resource "aws_s3_bucket" "main" {
    bucket = var.bucketname

}

resource "aws_s3_bucket_ownership_controls" "ownership" {
  bucket = aws_s3_bucket.main.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }   
}


resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.main.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_acl" "acl_config" {
  depends_on = [
    aws_s3_bucket_ownership_controls.ownership,
    aws_s3_bucket_public_access_block.public_access,
  ]
 
  bucket = aws_s3_bucket.main.id
  acl    = "public-read"
}

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.main.id
  key  = "index.html"
  source = "index.html"
  acl = "public-read"
  content_type = "text/html"

}


resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.main.id
  key  = "error.html"
  source = "error.html"
  acl = "public-read"
  content_type = "text/html"

}

/*resource "aws_s3_object" "profile" {
  bucket = aws_s3_bucket.main.id
  key = "profile.png"
  source = "profile.png"
  acl = "public-read"
}
*/

resource "aws_s3_bucket_website_configuration" "portfolio_website" {
  bucket = aws_s3_bucket.main.id
  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
  depends_on = [ 
    aws_s3_bucket_acl.acl_config
   ]

}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.main.id

  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_s3_bucket_server_side_encryption_configuration" "sse" {
  bucket = aws_s3_bucket.main.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "cleanup" {
  bucket = aws_s3_bucket.main.id

  rule {
    id     = "cleanup-old-versions"
    status = "Enabled"

    noncurrent_version_expiration {
      noncurrent_days = 1
    }
  }
}
