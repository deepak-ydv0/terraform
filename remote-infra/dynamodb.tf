resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name         = "TWS-Jnoon-dynamodb-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockId"

  attribute {
    name = "LockId"
    type = "S"
  }

  tags = {
    Name = "TWS-Jnoon-dynamodb-table"
  }
}
