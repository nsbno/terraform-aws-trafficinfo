###########################################################
# Configure Grafana dashboard for microservice.
#
# Create a dashboard using the different values provided
# as parameters to the microservice module to give a single
# glass pane to watch the different components used by the
# service.
###########################################################

data "aws_region" "current_region" {}

locals {
  current_region     = data.aws_region.current_region.name
}

resource "grafana_folder" "collection" {
  count = (var.grafana_use_existing_folder==-1 && var.grafana_create_dashboard == true) ? 1 : 0
  title = length(var.grafana_folder_name)>0 ? var.grafana_folder_name : title("${var.name_prefix} > ${var.service_name}")
}

resource "grafana_dashboard" "dashboard_in_folder" {
  count = var.grafana_create_dashboard == true ? 1 : 0
  folder = var.grafana_use_existing_folder>0 ? var.grafana_use_existing_folder : grafana_folder.collection[0].id
  config_json = templatefile(length(var.grafana_template_file)>0 ? var.grafana_template_file : "${path.module}/default-dashboard.tpl", {
    "name": title("${var.service_name} ${var.environment}")
    "environment": var.environment
    "name_prefix": var.name_prefix
    "application": var.service_name
    "service_name": var.service_name
    "region": local.current_region
    "uuid": filemd5(length(var.grafana_template_file)>0 ? var.grafana_template_file : "${path.module}/default-dashboard.tpl")
  })
}