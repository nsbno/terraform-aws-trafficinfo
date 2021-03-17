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
  count      = var.create_resource_server ? 1 : 0
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
  count                                = var.create_app_client ? 1 : 0
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
  count = (var.cognito_central_enable==false && var.create_app_client) ? 1 : 0
  name      = "/${var.name_prefix}/config/${var.service_name}/cognito/clientId"
  type      = "String"
  value     = aws_cognito_user_pool_client.app_client[0].id
  overwrite = true
}

# SSM Parameters to configure the cognito clientsecret for microservice when requesting
# access tokens from Cognito to communicate with other services.
resource "aws_ssm_parameter" "cognito-clientsecret" {
  count = (var.cognito_central_enable==false && var.create_app_client) ? 1 : 0
  name      = "/${var.name_prefix}/config/${var.service_name}/cognito/clientSecret"
  type      = "String"
  value     = aws_cognito_user_pool_client.app_client[0].client_secret
  overwrite = true
}

# SSM Parameters to configure the cognito endpoint url for microservice when requesting
# access tokens from Cognito to communicate with other services.
resource "aws_ssm_parameter" "cognito-url" {
  count = (var.cognito_central_enable==false && var.create_app_client) ? 1 : 0
  name  = "/${var.name_prefix}/config/${var.service_name}/cognito/url"
  type  = "String"
  value = "https://auth.${var.hosted_zone_name}"
  overwrite = true
}

###########################################################
# Create Resource Server and App Client in the central Cognito
#
# We need to Create all the oauth configuration in the central
# cognito and migrate our services over to use it so that
# the OAuth tokens is valid between different team accounts,
# For example traffic-control, traffic-gui and info.
###########################################################

locals {
  central_cognito_resource_server = var.create_resource_server ? {
    resource_server = {
      name_prefix = "${var.name_prefix}-${var.service_name}"
      identifier = "${var.cognito_resource_server_identifier_base}/${var.service_name}"

      scopes = [for key, value in var.resource_server_scopes : {
        scope_name = value.scope_name
        scope_description = value.scope_description
      }]
    }
  }: tomap()

  central_cognito_user_pool_client = var.create_app_client ? {
    user_pool_client = {
      name_prefix = "${var.name_prefix}-${var.service_name}"
      generate_secret = true

      allowed_oauth_flows = [ "client_credentials" ]
      allowed_oauth_scopes = var.app_client_scopes
      allowed_oauth_flows_user_pool_client = true
    }
  } : tomap()

  # build json config content for central cognito.
  central_congito_config_content = jsonencode(
    merge(local.central_cognito_resource_server, local.central_cognito_user_pool_client))
}

# upload delegated cognito config to S3 bucket.
# this will trigger the delegated cognito terraform pipeline and and apply the config.
resource "aws_s3_bucket_object" "delegated-cognito-config" {
  count =  length(var.cognito_central_bucket) > 0 ? 1 : 0
  bucket = var.cognito_central_bucket
  key    = "${length(var.cognito_central_env)>0 ? var.cognito_central_env : var.environment}/${local.current_account_id}/${var.name_prefix}-${var.service_name}.json"
  acl    = "bucket-owner-full-control"

  content = local.central_congito_config_content
  content_type = "application/json"
}

##
# Read Credentials from Secrets Manager and set in microservice SSM config.
# Store the md5 of the cognito config so that a change in md5/config
# Will trigger a new update on dependent resources.
#
# Using workaround using time_sleep for async pipeline in cognito to complete
# configuration of resource server and application client in delegated cognito.
# The sleep wait will only occur when the dependent S3 file is updated
# and during normal operation without changes it will not pause here.
resource "time_sleep" "wait_for_credentials" {
  count = (var.cognito_central_enable && var.create_app_client) ? 1 : 0
  create_duration = "300s"

  triggers = {
    config_hash = sha1(aws_s3_bucket_object.delegated-cognito-config[0].content)
  }
}

# The client credentials that are stored in Central Cognito.
data "aws_secretsmanager_secret_version" "microservice_client_credentials" {
  depends_on = [aws_s3_bucket_object.delegated-cognito-config[0], time_sleep.wait_for_credentials[0]]
  count = (var.cognito_central_enable && var.create_app_client) ? 1 : 0
  secret_id = "arn:aws:secretsmanager:eu-west-1:${var.cognito_central_account_id}:secret:${local.current_account_id}-${var.name_prefix}-${var.service_name}-id"
}

# Store client credentials from Central Cognito in SSM so that the microservice can read it.
# TODO probably find a more suitable name/location for the parameter.
resource "aws_ssm_parameter" "central_client_id" {
  count = (var.cognito_central_enable && var.create_app_client) ? 1 : 0
  name      =  "/${var.name_prefix}/config/${var.service_name}/cognito.clientId"
  type      = "SecureString"
  value     = jsondecode(data.aws_secretsmanager_secret_version.microservice_client_credentials[0].secret_string)["client_id"]
  overwrite = true

  # store the hash as a tag to establish a dependency to the wait_for_credentials resource
  tags      = merge(var.tags, {
    config_hash: time_sleep.wait_for_credentials[0].triggers.config_hash
  })
}

# Store client credentials from Central Cognito in SSM so that the microservice can read it.
# TODO probably find a more suitable name/location for the parameter.
resource "aws_ssm_parameter" "central_client_secret" {
  count = (var.cognito_central_enable && var.create_app_client) ? 1 : 0
  name      =  "/${var.name_prefix}/config/${var.service_name}/cognito.clientSecret"
  type      = "SecureString"
  value     =  jsondecode(data.aws_secretsmanager_secret_version.microservice_client_credentials[0].secret_string)["client_secret"]
  overwrite = true

  # store the hash as a tag to establish a dependency to the wait_for_credentials resource
  tags      = merge(var.tags, {
    config_hash: time_sleep.wait_for_credentials[0].triggers.config_hash
  })
}

# SSM Parameters to configure the cognito endpoint url for microservice when requesting
# access tokens from Cognito to communicate with other services.
resource "aws_ssm_parameter" "central_cognito_url" {
  count = (var.cognito_central_enable && var.create_app_client) ? 1 : 0
  name  = "/${var.name_prefix}/config/${var.service_name}/cognito.url"
  type  = "String"

  # store the hash as a tag to establish a dependency to the wait_for_credentials resource
  tags      = merge(var.tags, {
    config_hash: time_sleep.wait_for_credentials[0].triggers.config_hash
  })

  # Use default environment, or overridden cognito environment.
  value = "https://auth.${length(var.cognito_central_env)>0 ? var.cognito_central_env : var.environment}.cognito.vydev.io"
  overwrite = true
}

# SSM Parameters to configure the cognito endpoint jwks url to the microservice.
# used to verify the signature in the received access token.
# See the configuration of the jwt token verification in the microservice application-cloud.yml
# for how this is configured for each microservice.
resource "aws_ssm_parameter" "central_cognito_jwks_url" {
  count = var.cognito_central_enable ? 1 : 0
  name  = "/${var.name_prefix}/config/${var.service_name}/jwksUrl"
  type  = "String"

  # store the hash as a tag to establish a dependency to the wait_for_credentials resource
  tags      = merge(var.tags, {
    config_hash: time_sleep.wait_for_credentials[0].triggers.config_hash
  })

  # Use default environment, or overridden cognito environment.
  value = "https://cognito-idp.${local.current_region}.amazonaws.com/${var.cognito_central_user_pool_id}/.well-known/jwks.json"
  overwrite = true
}
