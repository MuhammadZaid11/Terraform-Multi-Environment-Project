variable "table_count" {
    description = "Number of DynamoDB tables to create"
    type        = number
}

variable "env" {
    description = "Environment name (e.g., dev, prod)"
    type        = string
}
variable "common_tags" {
    description = "Common tags to apply to all resources"
    type        = map(string)
    default = {}
}