data "aws_region" "current" {}

data "aws_partition" "current" {}

# add the microservice to the api-gateway
resource "aws_api_gateway_rest_api" "main" {
  name = "${var.name_prefix}-${var.service_name}"
  endpoint_configuration {
    types = ["REGIONAL"]
  }

  tags = var.tags
}

#add authorizer
resource "aws_api_gateway_authorizer" "cognito_user_pools" {
  identity_source = "method.request.header.Authorization"
  name            = "authorizer-${var.service_name}"
  rest_api_id     = aws_api_gateway_rest_api.main.id
  type            = "COGNITO_USER_POOLS"
  provider_arns   = [var.cognito_user_pool_arn]
}

resource "aws_api_gateway_request_validator" "parameters" {
  name                        = "Validate query string parameters and headers"
  rest_api_id                 = aws_api_gateway_rest_api.main.id
  validate_request_body       = false
  validate_request_parameters = true
}

# Streams

resource "aws_api_gateway_resource" "stream" {
  path_part   = "streams"
  parent_id   = aws_api_gateway_rest_api.main.root_resource_id
  rest_api_id = aws_api_gateway_rest_api.main.id
}

resource "aws_api_gateway_method" "streams_get" {
  rest_api_id = aws_api_gateway_rest_api.main.id
  resource_id = aws_api_gateway_resource.stream.id
  http_method = "GET"

  api_key_required = var.api_key_required
  authorization    = var.authorization
  authorizer_id    = aws_api_gateway_authorizer.cognito_user_pools.id

  request_validator_id = aws_api_gateway_request_validator.parameters.id
}

resource "aws_api_gateway_method_response" "streams_get_200" {
  rest_api_id = aws_api_gateway_rest_api.main.id
  resource_id = aws_api_gateway_resource.stream.id
  http_method = aws_api_gateway_method.streams_get.http_method
  status_code = "200"
  response_models = {
    "application/json" = "Empty"
  }
  response_parameters = {}
}

resource "aws_api_gateway_integration" "stream_get" {
  rest_api_id             = aws_api_gateway_rest_api.main.id
  resource_id             = aws_api_gateway_resource.stream.id
  http_method             = aws_api_gateway_method.streams_get.http_method
  integration_http_method = "POST"
  type                    = "AWS"
  timeout_milliseconds    = var.timeout_milliseconds
  uri = format(
    "arn:%s:apigateway:%s:kinesis:action/DescribeStreamSummary",
    data.aws_partition.current.partition,
    data.aws_region.current.name
  )
  credentials = var.execution_arn
  request_parameters = {
    "integration.request.header.Content-Type" = "'application/x-amz-json-1.1'"
  }
  request_templates = {
    "application/json" = <<EOT
    {
        "StreamName": "${var.streamname}"
    }
    EOT
  }
}

resource "aws_api_gateway_integration_response" "stream_get" {
  depends_on  = [aws_api_gateway_integration.stream_get]
  rest_api_id         = aws_api_gateway_rest_api.main.id
  resource_id         = aws_api_gateway_resource.stream.id
  http_method         = aws_api_gateway_method.streams_get.http_method
  status_code         = aws_api_gateway_method_response.streams_get_200.status_code
  response_parameters = {}
}

