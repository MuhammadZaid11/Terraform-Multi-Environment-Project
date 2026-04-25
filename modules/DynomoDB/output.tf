output "table_names" {
    description = "Names of the DynomoDB Tables"
    value = aws_dynamodb_table.this[*].name
}

output "table_arns" {
    description = "ARNS of the DynomoDb tables"
    value = aws_dynamodb_table.this[*].arn
}