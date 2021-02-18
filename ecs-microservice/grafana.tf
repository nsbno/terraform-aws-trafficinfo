###########################################################
# Configure Grafana dashboard for microservice.
#
# Create a dashboard using the different values provided
# as parameters to the mciroservice module to give a single
# glass pane to watch the different components used by the
# service.
###########################################################

data "aws_region" "current" {}

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
  count  = var.grafana_create_dashboard == true && length(var.sns_publish_topics) > 0 ? 1 : 0
  folder = grafana_folder.collection[0].id
  config_json = templatefile("${path.module}/grafana-templates/sns-dashboard.tpl", {
    "name" : title("SNS ${var.service_name} ${var.environment}")
    "environment" : var.environment
    "name_prefix" : var.name_prefix
    "application" : var.service_name
    "service_name" : var.service_name
    "topic_names" : var.sns_publish_topics
    "region" : "eu-west-1"
    "uuid" : md5("SNS ${var.name_prefix} > ${var.service_name} > ${var.environment}")
  })
}