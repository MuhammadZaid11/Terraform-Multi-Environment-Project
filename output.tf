output "current_workspace" {
    description = "The current workspace in use"
    value = terraform.workspace
  
}

output "ec2_instance_ids" {
    description = "IDs of the EC2 instances"
    value = module.ec2.instance_ids
  }


output "s3_bucket_names" {
  description = "Names of the S3 buckets"
  value       = module.s3.bucket_names
}

output "s3_bucket_arns" {
  description = "ARNs of the S3 buckets"
  value       = module.s3.bucket_arns
}

output "dynamodb_table_names" {
  description = "Names of the DynamoDB tables"
  value       = module.dynamodb.table_names
}

output "dynamodb_table_arns" {
  description = "ARNs of the DynamoDB tables"
  value       = module.dynamodb.table_arns
}