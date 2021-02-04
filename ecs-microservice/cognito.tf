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
data "aws_caller_identity" "current_account" {}

locals {
  current_account_id = data.aws_caller_identity.current_account.account_id
}

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
#
# We need to Create all the oauth configuration in the central
# cognito and migrate our services over to use it so that
# the OAuth tokens is valid between different team accounts,
# For example traffic-control, traffic-gui and info.
###########################################################

# upload delegated cognito config to S3 bucket.
# this will trigger the delegated cognito terraform pipeline and and apply the config.
resource "aws_s3_bucket_object" "delegated-cognito-config" {
  count      = var.create_resource_server > 0 ? 1 : 0

  bucket = var.cognito_bucket
  key    = "${length(var.cognito_env)>0 ? var.cognito_env : var.environment}/${local.current_account_id}/${var.name_prefix}-${var.service_name}.json"
  acl    = "bucket-owner-full-control"

  ## TODO maybe pull this out to a template to do more advanced conditional logic.
  content = jsonencode({
    # Configure resource server.
    resource_server = {
      name_prefix = "${var.name_prefix}-${var.service_name}"
      identifier  = "${var.cognito_resource_server_identifier_base}/${var.service_name}"

      scopes = [for key, value in var.resource_server_scopes : {
        scope_name        = value.scope_name
        scope_description = value.scope_description
      }]
    }

    # Configure a user pool client
    # TODO. this should be conditionally toggled.
    user_pool_client = {
      name_prefix     = "${var.name_prefix}-${var.service_name}"
      generate_secret = true

      allowed_oauth_flows                  = ["client_credentials"]
      allowed_oauth_scopes                 = var.app_client_scopes
      allowed_oauth_flows_user_pool_client = true
    }
  })
  content_type = "application/json"
}

##
# Read Credentials from Secrets Manager and set in microservice SSM config.
#
# Using workaround using time_sleep for async pipeline in cognito to complete
# configuration of resource server and application client in delegated cognito.
# Using conditionally check using count because without the account id
# provided it is not possible to read the credentials, and I want the
# variable to be optional so that everything is backwards compatible
# with existing ecs-microservice definitions.
#
# The sleep wait will only occur when the dependent S3 file is updated
# and during normal operation without changes it will not pause here.
data "aws_secretsmanager_secret_version" "microservice_client_credentials" {
  count = length(var.cognito_account_id)>0 ? 1 : 0
  secret_id = "arn:aws:secretsmanager:eu-west-1:${var.cognito_account_id}:secret:${local.current_account_id}-${var.name_prefix}-${var.service_name}"
}

resource "time_sleep" "wait_for_credentials" {
  count = length(var.cognito_account_id)>0 ? 1 : 0
  create_duration = "120s"

  triggers = {
    trigger_content = aws_s3_bucket_object.delegated-cognito-config[0].content_base64
    client_id = jsondecode(data.aws_secretsmanager_secret_version.microservice_client_credentials[0].secret_string)["client_id"]
    client_secret = jsondecode(data.aws_secretsmanager_secret_version.microservice_client_credentials[0].secret_string)["client_secret"]
  }
}


resource "aws_ssm_parameter" "client_id" {
  count = length(var.cognito_account_id)>0 ? 1 : 0
  name      = "/${var.name_prefix}/config/${var.service_name}/client_id"
  type      = "SecureString"
  value     = time_sleep.wait_for_credentials[0].triggers["client_id"]
  overwrite = true
}

resource "aws_ssm_parameter" "client_secret" {
  count = length(var.cognito_account_id)>0 ? 1 : 0
  name      = "/${var.name_prefix}/config/${var.service_name}/client_secret"
  type      = "SecureString"
  value     = time_sleep.wait_for_credentials[0].triggers["client_secret"]
  overwrite = true
}