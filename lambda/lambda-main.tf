resource "aws_lambda_function" "lambda-tf" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  function_name = var.name
  filename      = var.file_name
  handler       = "index.handler"
  role          = var.credentials
  runtime       = var.njs_runtime

}