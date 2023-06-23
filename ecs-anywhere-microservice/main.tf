###############################################################
# High level module for microservice running in ECS Anywhere
#
###############################################################
#
# Define the ECS Anywhere task with some default values
###############################################################
module "agent" {
  source                       = "github.com/nsbno/terraform-aws-ecs-anywhere?ref=6571a02"
  name_prefix                  = "${var.name_prefix}-${var.application_name}"
  cluster_arn                  = var.cluster_arn
  cluster_name                 = var.cluster_name
  pager_duty_critical_endpoint = var.pager_duty_critical_endpoint
  pager_duty_degraded_endpoint = var.pager_duty_degraded_endpoint
  task_container_image         = var.task_container_image
  task_container_health_check  = var.task_container_health_check
  task_container_environment   = var.task_container_environment
  task_port_mappings           = var.task_port_mappings
  task_cpu                     = var.task_cpu
  task_memory                  = var.task_memory
  desired_count                = var.desired_count

  deployment_maximum_percent         = var.deployment_maximum_percent
  deployment_minimum_healthy_percent = var.deployment_minimum_healthy_percent

  tags = var.tags

  # enable forwarding of logs to elasticcloud
  enable_elasticcloud = var.elasticcloud_enabled
  lambda_elasticcloud = data.aws_lambda_alias.log_to_elasticsearch_alias.arn
}

# lambda user to forward logs to ElasticCloud.
data "aws_lambda_alias" "log_to_elasticsearch_alias" {
  name          = var.name_prefix
  function_name = "${var.name_prefix}-${var.elasticcloud_function_name}"
}

###############################################################
# Define permissions for the ECS task above to let it access
# different kinds of resource in AWS, for example SQS and SNS.
###############################################################
module "agent_task_role_attachments" {
  source         = "../ecs-anywhere-task-role-attachments"
  name_prefix    = "${var.name_prefix}-${var.application_name}"
  task_role_name = module.agent.task_role

  allowed_decrypt_kms_arns = var.allowed_decrypt_kms_arns
  allowed_publish_sns_arns = var.allowed_publish_sns_arns

  # Allow agent to read from parameter store
  # add additional parameters as needed
  # Set broad access to ssm for debugging.
  allowed_ssm_arns = [
    "arn:aws:ssm:${var.current_region}:${var.current_account}:parameter/${var.name_prefix}/config",
    "arn:aws:ssm:${var.current_region}:${var.current_account}:parameter/${var.name_prefix}/config/*",
  ]
}

data "aws_iam_policy_document" "metrics_for_on_prem_agent" {
  statement {
    effect  = "Allow"
    actions = [
      "cloudwatch:PutMetricData",
    ]
    condition {
      test     = "StringEquals"
      variable = "cloudwatch:namespace"
      values   = ["${var.name_prefix}-${var.application_name}"]
    }
    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "metrics_for_agent" {
  role   = module.agent.task_role
  policy = data.aws_iam_policy_document.metrics_for_on_prem_agent.json
}

