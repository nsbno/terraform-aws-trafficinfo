###########################################################
# Configure Grafana dashboard for microservice.
#
# Create a dashboard using the different values provided
# as parameters to the mciroservice module to give a single
# glass pane to watch the different components used by the
# service.
###########################################################

data "aws_region" "current" {}

locals {
  sns_topic_names = [
    for arn in var.sns_publish_topics :
    element(split(":", arn), length(split(":", arn))-1)
  ]
  sqs_queue_names = [
    for arn in var.sqs_queues :
    element(split(":", arn), length(split(":", arn))-1)
  ]
}

resource "grafana_folder" "collection" {
  count = var.grafana_create_dashboard == true ? 1 : 0
  title = title("${var.name_prefix} > ${var.service_name} > ${var.environment}")
}

resource "grafana_dashboard" "dashboard_in_folder" {
  count  = var.grafana_create_dashboard == true ? 1 : 0
  folder = grafana_folder.collection[0].id
  config_json = templatefile("${path.module}/grafana-templates/ecs-dashboard.tpl", {
    "name" : title("ECS ${var.service_name} ${var.environment}")
    "environment" : var.environment
    "name_prefix" : var.name_prefix
    "application" : var.service_name
    "service_name" : var.service_name
    "region" : "eu-west-1"
    "uuid" : md5("ECS ${var.name_prefix} > ${var.service_name} > ${var.environment}")
  })
}

resource "grafana_dashboard" "rds_dashboard_in_folder" {
  count  = var.grafana_create_dashboard == true && length(var.grafana_db_instance_identifier) > 0 ? 1 : 0
  folder = grafana_folder.collection[0].id
  config_json = templatefile("${path.module}/grafana-templates/rds-dashboard.tpl", {
    "name" : title("RDS ${var.service_name} ${var.environment}")
    "environment" : var.environment
    "name_prefix" : var.name_prefix
    "application" : var.service_name
    "service_name" : var.service_name
    "db_instance_identifier" : var.grafana_db_instance_identifier
    "region" : "eu-west-1"
    "uuid" : md5("RDS ${var.name_prefix} > ${var.service_name} > ${var.environment}")
  })
}

resource "grafana_dashboard" "sns_dashboard_in_folder" {
  count  = var.grafana_create_dashboard == true && length(local.sns_topic_names) > 0 ? 1 : 0
  folder = grafana_folder.collection[0].id
  config_json = templatefile("${path.module}/grafana-templates/sns-dashboard.tpl", {
    "name" : title("SNS ${var.service_name} ${var.environment}")
    "environment" : var.environment
    "name_prefix" : var.name_prefix
    "application" : var.service_name
    "service_name" : var.service_name
    "topic_names" : local.sns_topic_names
    "region" : "eu-west-1"
    "uuid" : md5("SNS ${var.name_prefix} > ${var.service_name} > ${var.environment}")
  })
}

resource "grafana_dashboard" "sqs_dashboard_in_folder" {
  count  = var.grafana_create_dashboard == true && length(local.sqs_queue_names) > 0 ? 1 : 0
  folder = grafana_folder.collection[0].id
  config_json = templatefile("${path.module}/grafana-templates/sqs-dashboard.tpl", {
    "name" : title("SQS ${var.service_name} ${var.environment}")
    "environment" : var.environment
    "name_prefix" : var.name_prefix
    "application" : var.service_name
    "service_name" : var.service_name
    "queue_name" : local.sqs_queue_names[0]
    "region" : "eu-west-1"
    "uuid" : md5("SQS ${var.name_prefix} > ${var.service_name} > ${var.environment}")
  })
}