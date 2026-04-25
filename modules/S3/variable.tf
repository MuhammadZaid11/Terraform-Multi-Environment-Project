variable "env" {
    description = "Environment name (e.g., dev, staging, prod)"
    type        = string
  
}

variable "bucket_count" {
    description = "Number of S3 buckets to create"
    type        = number
  
}

variable "common_tags" {
    description = "Common tags to apply to all resources"
    type        = map(string)
    default = {}
  
}