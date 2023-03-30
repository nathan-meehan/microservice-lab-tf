resource "aws_lambda_function" "test_lambda_2" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  function_name = "lambda-tf-test"
  filename      = var.file_name
  handler       = "index.handler"
  role          = "arn:aws:iam::535566415663:role/LabRole"
  runtime       = "nodejs16.x"

}