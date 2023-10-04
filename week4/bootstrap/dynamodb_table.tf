resource "aws_dynamodb_table" "dynamodb" {
    name = "terraform_state-tracker-lock"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
      name = "LockID"
      type = "S"
    }
}