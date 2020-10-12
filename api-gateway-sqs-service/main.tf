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
  
resource "aws_iam_role" "api_gateway_sqs_role" {
  name = "${var.name_prefix}-${var.service_name}-apigateway-sqs"

  assume_role_policy = data.aws_iam_policy_document.gateway_assume_role.json
}

data "aws_iam_policy_document" "gateway_assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      identifiers = ["apigateway.amazonaws.com"]
      type        = "Service"
    }
  }
}

data "aws_iam_policy_document" "api_gateway_sqs_policy" {
  statement {
    effect  = "Allow"
    actions = [
      "sqs:SendMessage"
    ]
    resources = [var.sqs_integration_arn]
  }

  statement {
    effect  = "Allow"
    actions = [
      "sqs:ListQueues"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "api_policy" {
  name = "${var.name_prefix}-${var.service_name}-apigateway-sqs-policy"

  policy = data.aws_iam_policy_document.api_gateway_sqs_policy.json
}


resource "aws_iam_role_policy_attachment" "api_exec_role" {
  role       =  aws_iam_role.api_gateway_sqs_role.name
  policy_arn =  aws_iam_policy.api_policy.arn
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