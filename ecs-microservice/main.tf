##########################################################################
# Module for defining a generic Microservice for ECS Fargate.
# The module will configure
# - alb load balancer for accessing the service
# - api gateway using a openapi schema
# - permissions to push metrics from the service to cloudwatch
# - read configuration from parameter store.
# - access to kms keys
# - access to sqs queues
# - access to dynamodb tables
# - access to sns topics
# - central cognito resource server, scopes and application client.
#
##########################################################################
locals {
  lb_identifiers = toset([for k, lb in var.lbs : k])
  lb_arns        = [for k, lb in var.lbs : nonsensitive(lb.arn)]
}

module "ecs_fargate_microservice" {
  source                            = "github.com/nsbno/terraform-aws-ecs-fargate?ref=4aa9eb6"
  cluster_id                        = var.ecs_cluster.id
  name_prefix                       = "${var.name_prefix}-${var.service_name}"
  vpc_id                            = var.vpc.vpc_id
  private_subnet_ids                = var.vpc.private_subnet_ids
  task_container_image              = var.task_container_image
  task_container_port               = var.task_container_port
  task_container_protocol           = var.task_container_protocol
  task_definition_memory            = var.task_definition_memory
  task_definition_cpu               = var.task_definition_cpu
  task_container_environment        = var.task_container_environment
  health_check_grace_period_seconds = var.health_check_grace_period_seconds

  health_check = {
    port                = var.health_check_port
    path                = var.health_check_path
    healthy_threshold   = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_unhealthy_threshold
    timeout             = var.health_check_timeout
    interval            = var.health_check_interval
  }

  lb_arns                         = local.lb_arns
  target_group_identifiers        = local.lb_identifiers
  task_container_assign_public_ip = true

  tags          = var.tags
  desired_count = var.desired_count
  size_in_gib   = var.size_in_gib
}


resource "aws_lb_listener_rule" "ecs_fargate_microservice_lb_listener" {
  for_each     = var.lbs
  listener_arn = each.value.listener_arn
  priority     = var.alb_priority

  action {
    type             = "forward"
    target_group_arn = module.ecs_fargate_microservice.target_group_arns[each.key]
  }

  condition {
    path_pattern {
      values = ["/${var.base_path}/*"]
    }
    # field = "path-pattern"
    # values = [
    # "/${var.base_path}/*"]
  }
}

# Let the load balancer communicate with microservice on the service port.
resource "aws_security_group_rule" "ecs_fargate_microservice_alb_allow" {
  for_each                 = var.lbs
  security_group_id        = module.ecs_fargate_microservice.service_sg_id
  type                     = "ingress"
  from_port                = var.service_port
  to_port                  = var.task_container_port
  protocol                 = "tcp"
  source_security_group_id = each.value.security_group_id
}

resource "aws_security_group_rule" "ecs_rds_sg_allow" {
  for_each                 = length(var.rds_enabled) > 0 ? { 1 : "dummy" } : {}
  security_group_id        = module.ecs_fargate_microservice.service_sg_id
  type                     = "ingress"
  from_port                = 5432
  to_port                  = 5432
  protocol                 = "tcp"
  source_security_group_id = module.ecs_fargate_microservice.service_sg_id
}

# Should publish metrics to cloudwatch
data "aws_iam_policy_document" "ecs_fargate_microservice_publish_metrics_to_cloudwatch" {
  statement {
    effect = "Allow"

    resources = [
      "*"
    ]

    actions = [
      "cloudwatch:PutMetricData"
    ]
  }
}

# Let the microservice push metrics to cloudwatch
resource "aws_iam_role_policy" "ecs_fargate_microservice_publish_metrics_to_cloudwatch" {
  name = "ecs_fargate_microservice_${var.name_prefix}_${var.service_name}_publish_metrics_to_cloudwatch"

  policy = data.aws_iam_policy_document.ecs_fargate_microservice_publish_metrics_to_cloudwatch.json
  role   = module.ecs_fargate_microservice.task_role_name
}

# Config is stored in System Manager under Parameter store with path /config.
data "aws_iam_policy_document" "ecs_fargate_microservice_read_ssm_application_config" {
  statement {
    effect = "Allow"

    actions = [
      "ssm:GetParameters",
      "ssm:GetParameter",
      "ssm:GetParameterHistory",
      "ssm:GetParametersByPath"
    ]

    resources = [
      "arn:aws:ssm:eu-west-1:${var.current_account}:parameter/${var.name_prefix}/config/*",
    ]
  }
}

# let the microservice read from ssm
resource "aws_iam_role_policy" "ecs_fargate_microservice_read_ssm_config_from_otc" {
  name = "${var.name_prefix}-read-ssm-config-from-otc"

  policy = data.aws_iam_policy_document.ecs_fargate_microservice_read_ssm_application_config.json
  role   = module.ecs_fargate_microservice.task_role_name
}

# add the microservice to the api-gateway
resource "aws_api_gateway_rest_api" "api_gateway_microservice_rest_api" {
  name = "${var.name_prefix}-${var.service_name}"
  body = var.schema
}

resource "aws_api_gateway_deployment" "api_gateway_microservice_rest_api_deployment_v1" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway_microservice_rest_api.id
  lifecycle {
    create_before_destroy = true
  }

  triggers = {
    redeployment = sha256(var.schema)
  }
}

resource "aws_api_gateway_stage" "api_gateway_microservice_stage_v1" {
  rest_api_id          = aws_api_gateway_rest_api.api_gateway_microservice_rest_api.id
  stage_name           = "v1_new"
  deployment_id        = aws_api_gateway_deployment.api_gateway_microservice_rest_api_deployment_v1.id
  xray_tracing_enabled = var.api_gateway_enable_xray

  access_log_settings {
    destination_arn = aws_cloudwatch_log_group.cloudwatch_log_group_api_gateway_access_log.arn
    format          = file("${path.module}/logs/access_log_format.json")
  }

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

resource "aws_cloudwatch_log_group" "cloudwatch_log_group_api_gateway_access_log" {
  name              = "API-Gateway-${var.name_prefix}-${var.service_name}-access-log"
  tags              = var.tags
  retention_in_days = var.access_log_retention_in_days
}

data "aws_iam_policy_document" "read_sqs_from_microservice" {
  statement {
    effect = "Allow"

    resources = var.sqs_queues

    actions = [
      "sqs:ReceiveMessage",
      "sqs:DeleteMessage",
      "sqs:GetQueueAttributes"
    ]
  }
}

data "aws_iam_policy_document" "write_sqs_from_microservice" {
  statement {
    effect = "Allow"

    resources = var.sqs_queues_write

    actions = [
      "sqs:SendMessage",
    ]
  }
}

data "aws_iam_policy_document" "sns_publish_topic" {
  statement {
    effect = "Allow"

    resources = var.sns_publish_topics

    actions = [
      "SNS:Publish"
    ]
  }
}

data "aws_iam_policy_document" "sns_subscribe_topic" {
  statement {
    effect = "Allow"

    resources = var.sns_subscribe_topics

    actions = [
      "SNS:Subscribe",
      "SNS:Unsubscribe",
      "SNS:ConfirmSubscription"
    ]
  }
}

resource "aws_iam_role_policy" "read_sqs_from_microservice" {
  for_each = length(var.sqs_queues) > 0 ? { 1 : "dummy" } : {}
  name     = "${var.name_prefix}-${var.service_name}-read_sqs_from_microservice"

  policy = data.aws_iam_policy_document.read_sqs_from_microservice.json
  role   = module.ecs_fargate_microservice.task_role_name
}

resource "aws_iam_role_policy" "write_sqs_from_microservice" {
  for_each = length(var.sqs_queues_write) > 0 ? { 1 : "dummy" } : {}
  name     = "${var.name_prefix}-${var.service_name}-write_sqs_from_microservice"

  policy = data.aws_iam_policy_document.write_sqs_from_microservice.json
  role   = module.ecs_fargate_microservice.task_role_name
}

resource "aws_iam_role_policy" "read_encryption_key-from-microservice" {
  for_each = length(var.encryption_keys) > 0 ? { 1 : "dummy" } : {}
  name     = "${var.name_prefix}-read_encryption_key-from-microservice"

  policy = data.aws_iam_policy_document.read_encryption_key.json
  role   = module.ecs_fargate_microservice.task_role_name
}

resource "aws_iam_role_policy" "subscribe-sns-topic-from-microservice" {
  for_each = length(var.sns_subscribe_topics) > 0 ? { 1 : "dummy" } : {}
  name     = "${var.name_prefix}-subscribe_sns_topic-from-microservice"

  policy = data.aws_iam_policy_document.sns_subscribe_topic.json
  role   = module.ecs_fargate_microservice.task_role_name
}

resource "aws_iam_role_policy" "publish-sns-topic-from-microservice" {
  for_each = length(var.sns_publish_topics) > 0 ? { 1 : "dummy" } : {}
  name     = "${var.name_prefix}-publish_sns_topic-from-microservice"

  policy = data.aws_iam_policy_document.sns_publish_topic.json
  role   = module.ecs_fargate_microservice.task_role_name
}

resource "aws_iam_role_policy" "read-s3-bucket-from-microservice" {
  for_each = length(var.s3_read_buckets) > 0 ? { 1 : "dummy" } : {}
  name     = "${var.name_prefix}-read_bucket-from-microservice"

  policy = data.aws_iam_policy_document.read_s3_bucket.json
  role   = module.ecs_fargate_microservice.task_role_name
}

data "aws_iam_policy_document" "read_s3_bucket" {
  statement {
    effect = "Allow"

    actions = [
      "s3:GetObject",
      "s3:GetObjectVersion",
      "s3:ListBucket",
      "s3:GetBucketLocation"
    ]

    resources = concat(var.s3_read_buckets, formatlist("%s/*", var.s3_read_buckets))
  }
}

resource "aws_iam_role_policy" "write-s3-bucket-from-microservice" {
  for_each = length(var.s3_write_buckets) > 0 ? { 1 : "dummy" } : {}
  name     = "${var.name_prefix}-write_bucket-from-microservice"

  policy = data.aws_iam_policy_document.write_s3_bucket.json
  role   = module.ecs_fargate_microservice.task_role_name
}

data "aws_iam_policy_document" "write_s3_bucket" {
  statement {
    effect = "Allow"

    actions = [
      "s3:PutObject",
      "s3:ListBucket",
    ]

    resources = concat(var.s3_write_buckets, formatlist("%s/*", var.s3_write_buckets))
  }
}

resource "aws_iam_role_policy" "delete-s3-bucket-from-microservice" {
  for_each = length(var.s3_delete_buckets) > 0 ? { 1 : "dummy" } : {}
  name     = "${var.name_prefix}-delete_bucket-from-microservice"

  policy = data.aws_iam_policy_document.delete_s3_bucket.json
  role   = module.ecs_fargate_microservice.task_role_name
}

data "aws_iam_policy_document" "delete_s3_bucket" {
  statement {
    effect = "Allow"

    actions = [
      "s3:DeleteObject",
    ]

    resources = concat(var.s3_delete_buckets, formatlist("%s/*", var.s3_delete_buckets))
  }
}

data "aws_iam_policy_document" "read_encryption_key" {
  statement {
    effect = "Allow"
    # TODO should not have GenerateDataKey here
    actions = [
      "kms:Decrypt",
      "kms:GenerateDataKey"
    ]

    resources = var.encryption_keys
  }
}

data "aws_iam_policy_document" "dynamodb-table-permissions" {
  statement {
    effect = "Allow"

    actions = [
      "dynamodb:PutItem",
      "dynamodb:GetItem",
      "dynamodb:Query",
      "dynamodb:Scan",
      "dynamodb:BatchWriteItem",
      "dynamodb:BatchGetItem",
      "dynamodb:DeleteItem",
      "dynamodb:UpdateItem",
    ]

    resources = var.dynamodb_tables
  }
}

resource "aws_iam_role_policy" "dynamodb-table-policy" {
  for_each = length(var.dynamodb_tables) > 0 ? { 1 : "dummy" } : {}
  name     = "${var.name_prefix}-dynamodb-table-policy"

  policy = data.aws_iam_policy_document.dynamodb-table-permissions.json
  role   = module.ecs_fargate_microservice.task_role_name
}

# Lambda subscriptions
resource "aws_cloudwatch_log_subscription_filter" "cloudwatch_access_log_subscription_lambda" {
  count           = var.enable_elasticcloud == false ? 0 : 1
  destination_arn = var.lambda_elasticcloud
  filter_pattern  = ""
  log_group_name  = "${var.name_prefix}-${var.service_name}"
  name            = "ElasticsearchStream-${var.name_prefix}"
  distribution    = "ByLogStream"
}
