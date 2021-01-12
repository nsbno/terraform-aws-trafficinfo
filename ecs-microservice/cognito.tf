###########################################################
# Configure OAuth authentication and authorization for microservice.
# Everything here is optional and enabled with config flags
# on the ecs-microservice module.
#
# It will
# - create a cognito resource server (optional)
# - create an cognito application client (optional)
# - create application properties to for micronaut to request tokens. (optional)
#
###########################################################

# create a resource server for the microservice
resource "aws_cognito_resource_server" "resource_server" {
  count      = var.create_resource_server > 0 ? 1 : 0
  identifier = "${var.cognito_resource_server_identifier_base}/${var.base_path}"
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

# create a default application client for the microservice, so
# that the microservice can authenticate to cognito and request
# an access_token to use for calling other microservices.
resource "aws_cognito_user_pool_client" "app_client" {
  count                                = var.create_app_client > 0 ? 1 : 0
  depends_on                           = [aws_cognito_resource_server.resource_server]
  name                                 = "${var.name_prefix}-${var.service_name}-client"
  user_pool_id                         = var.user_pool_id
  generate_secret                      = true
  explicit_auth_flows                  = ["ADMIN_NO_SRP_AUTH"]
  allowed_oauth_flows                  = ["client_credentials"]
  allowed_oauth_scopes                 = var.app_client_scopes
  allowed_oauth_flows_user_pool_client = true
}

# SSM Parameters to configure the cognito clientid for microservice when requesting
# access tokens from Cognito to communicate with other services.
resource "aws_ssm_parameter" "cognito-clientid" {
  count     = var.create_app_client > 0 ? 1 : 0
  name      = "/${var.name_prefix}/config/${var.service_name}/cognito/clientId"
  type      = "String"
  value     = aws_cognito_user_pool_client.app_client[0].id
  overwrite = true
}

# SSM Parameters to configure the cognito clientsecret for microservice when requesting
# access tokens from Cognito to communicate with other services.
resource "aws_ssm_parameter" "cognito-clientsecret" {
  count     = var.create_app_client > 0 ? 1 : 0
  name      = "/${var.name_prefix}/config/${var.service_name}/cognito/clientSecret"
  type      = "String"
  value     = aws_cognito_user_pool_client.app_client[0].client_secret
  overwrite = true
}

# SSM Parameters to configure the cognito endpoint url for microservice when requesting
# access tokens from Cognito to communicate with other services.
resource "aws_ssm_parameter" "cognito-url" {
  count = var.create_app_client > 0 ? 1 : 0
  name  = "/${var.name_prefix}/config/${var.service_name}/cognito/url"
  type  = "String"
  value = "https://auth.${var.hosted_zone_name}"
}


###########################################################
# Create Resource Server and App Client in the central Cognito
# instance if userpool id is provided as parameter.
#
# We need to Create all the oauth configuration in the central
# cognito and migrate our services over to
###########################################################
# create a resource server for the microservice
resource "aws_cognito_resource_server" "central_resource_server" {
  count      = var.central_user_pool_id && var.create_resource_server > 0 ? 1 : 0
  identifier = "${var.cognito_resource_server_identifier_base}/${var.base_path}"
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

# create a default application client for the microservice, so
# that the microservice can authenticate to cognito and request
# an access_token to use for calling other microservices.
resource "aws_cognito_user_pool_client" "central_app_client" {
  count                                = var.central_user_pool_id && var.create_app_client > 0 ? 1 : 0
  depends_on                           = [aws_cognito_resource_server.resource_server]
  name                                 = "${var.name_prefix}-${var.service_name}-client"
  user_pool_id                         = var.user_pool_id
  generate_secret                      = true
  explicit_auth_flows                  = ["ADMIN_NO_SRP_AUTH"]
  allowed_oauth_flows                  = ["client_credentials"]
  allowed_oauth_scopes                 = var.app_client_scopes
  allowed_oauth_flows_user_pool_client = true
}