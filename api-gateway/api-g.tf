resource "aws_apigatewayv2_api" "tf_api_g" {
  name          = "example-http-api"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_integration" "tf_api_lambda" {
  api_id             = aws_apigatewayv2_api.tf_api_g.id
  integration_type   = "AWS_PROXY"
  integration_method = "POST"
  integration_uri    = var.lambda_uri
}

resource "aws_apigatewayv2_stage" "example" {
  api_id      = aws_apigatewayv2_api.tf_api_g.id
  name        = "$default"
  auto_deploy = true
}

resource "aws_apigatewayv2_route" "get_items" {
  api_id    = aws_apigatewayv2_api.tf_api_g.id
  route_key = "GET /items"
  target    = "integrations/${aws_apigatewayv2_integration.tf_api_lambda.id}"
}

resource "aws_apigatewayv2_route" "get_item" {
  api_id    = aws_apigatewayv2_api.tf_api_g.id
  route_key = "GET /items/{id}"
  target    = "integrations/${aws_apigatewayv2_integration.tf_api_lambda.id}"
}

resource "aws_apigatewayv2_route" "put_items" {
  api_id    = aws_apigatewayv2_api.tf_api_g.id
  route_key = "PUT /items"
  target    = "integrations/${aws_apigatewayv2_integration.tf_api_lambda.id}"
}

resource "aws_apigatewayv2_route" "delete_items" {
  api_id    = aws_apigatewayv2_api.tf_api_g.id
  route_key = "DELETE /items/{id}"
  target    = "integrations/${aws_apigatewayv2_integration.tf_api_lambda.id}"
}





