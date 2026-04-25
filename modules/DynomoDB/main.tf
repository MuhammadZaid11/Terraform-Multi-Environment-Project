resource "aws_dynamodb_table" "this" {
    count = var.table_count
    name = "${var.env}-dynamodb-table-${count.index + 1}"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "dynomodb_id"

    attribute {
      name = "dynomodb_id"
      type = ("S")
    }

    tags = merge((var.common_tags),{
        Name = "${var.env}-dynamodb-table-${count.index + 1}"
    })
  
}