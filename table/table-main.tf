resource "aws_dynamodb_table" "tf_test_table" {
  name             = var.table_name #directly referenced in index.njs
  hash_key         = "id"
  billing_mode     = "PAY_PER_REQUEST"

  attribute {
    name = "id"
    type = "S"
  }

}