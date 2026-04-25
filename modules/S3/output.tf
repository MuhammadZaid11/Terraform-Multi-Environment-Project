output "bucket_names" {
    description = "Name of the S3 Buckets"
    value = aws_s3_bucket.this[*].bucket
  
}

output "bucket_arns" {
    description = "ARNs of the S3 Buckets"
    value = aws_s3_bucket.this[*].arn
  
}