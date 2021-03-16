# add the microservice to the api-gateway
resource "aws_api_gateway_rest_api" "api_gateway_microservice_rest_api" {
  name = "${var.name_prefix}-${var.service_name}"
  body = var.schema
}

resource "aws_api_gateway_deployment" "api_gateway_microservice_rest_api_deployment_v1" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway_microservice_rest_api.id
  stage_name  = "v1"
  variables = {
    hash = sha256(var.schema)
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_base_path_mapping" "gateway_base_path_mapping" {
  api_id      = aws_api_gateway_rest_api.api_gateway_microservice_rest_api.id
  stage_name  = aws_api_gateway_deployment.api_gateway_microservice_rest_api_deployment_v1.stage_name
  domain_name = var.domain_name
  base_path   = var.base_path
}

# create a resource server for the microservice
resource "aws_cognito_resource_server" "resource_server" {
  count      = 1
  identifier = "${var.cognito_resource_server_identifier_base}/${var.service_name}"
  name       = "${var.name_prefix}-${var.service_name}"

  dynamic "scope" {
    for_each = [for key, value in var.resource_server_scopes : {
      scope_name        = value.scope_name
      scope_description = value.scope_description
    }]

    content {
      scope_name        = scope.value.scope_name
      scope_description = scope.value.scope_description
    }
  }

  user_pool_id = var.user_pool_id
}

module "api-gateway-sqs-roles" {
  source       = "../api-gateway-sqs-roles"
  name_prefix  = var.name_prefix
  service_name = var.service_name
  sqs_integration_arn = var.sqs_integration_arn
}