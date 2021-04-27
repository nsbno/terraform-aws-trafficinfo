# add the microservice to the api-gateway
resource "aws_api_gateway_rest_api" "api_gateway_microservice_rest_api" {
  name = "${var.name_prefix}-${var.service_name}"
  body = var.schema
}

resource "aws_api_gateway_deployment" "api_gateway_microservice_rest_api_deployment_v1" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway_microservice_rest_api.id

  triggers = {
    redeployment = sha256(var.schema)
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "api_gateway_microservice_stage_v1" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway_microservice_rest_api.id
  stage_name  = "v1_new"
  deployment_id = aws_api_gateway_deployment.api_gateway_microservice_rest_api_deployment_v1.id
  xray_tracing_enabled = var.api_gateway_enable_xray

  variables = {
    hash = sha256(var.schema)
  }

}

resource "aws_api_gateway_base_path_mapping" "gateway_base_path_mapping" {
  api_id      = aws_api_gateway_rest_api.api_gateway_microservice_rest_api.id
  stage_name  = aws_api_gateway_stage.api_gateway_microservice_stage_v1.stage_name
  domain_name = var.domain_name
  base_path   = var.base_path
}

resource "aws_api_gateway_method_settings" "gateway_settings" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway_microservice_rest_api.id
  stage_name  = aws_api_gateway_stage.api_gateway_microservice_stage_v1.stage_name

  method_path = "*/*"

  settings {
    logging_level = "ERROR"
  }
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
