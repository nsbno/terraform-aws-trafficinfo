variable "name_prefix" {
  description = "A prefix used for naming resources."
  type        = string
}

variable "environment" {
  description = "Name of the environment, Ex. dev, test ,stage, prod."
  type        = string
}

variable "application_name" {
  description = "The name of the application -- used together with name_prefix."
  type        = string
}

variable "current_account" {
  description = "account number of current identity"
  type        = string
}

variable "current_region" {
  description = "name of current region"
  type        = string
}

variable "tags" {
  description = "A map of tags (key-value pairs) passed to resources."
  type        = map(string)
  default     = {}
}

variable "cognito_central_account_id" {
  description = "(Optional) The Central Cognito account to retrieve client credentials from. Default is empty string."
  type        = string
  default     = ""
}

variable "cognito_central_override_env" {
  description = "(Optional) The Central Cognito account to retrieve client credentials from. Default is empty string."
  type        = string
  default     = ""
}

variable "cognito_central_bucket" {
  description = "(Optional) Configure where to upload delegated cognito config. Default is vydev-delegated-cognito-staging."
  type        = string
  default     = "vydev-delegated-cognito-staging"
}

variable "cognito_central_enable" {
  description = "(Optional) Use the Central Cognito instance. Default is True."
  type        = bool
  default     = true
}

variable "cognito_central_user_pool_id" {
  description = "(Optional) Override the shared config user pool id."
  type        = string
  default     = ""
}

variable "cognito_central_provider_arn" {
  description = "(Optional) Override the shared config provider arn."
  type        = string
  default     = ""
}

variable "cognito_central_resource_server_identifier" {
  description = "(Optional) Configure the base identifier used by central cognito when creating resource servers."
  type        = string
  default     = ""
}

##############################################
# PagerDuty Endpoint to subscribe SNS Alarms for service.
# Two levels of alarms, Critical and Degraded,
##############################################
variable "pager_duty_critical_endpoint" {
  description = "(Optional) The PagerDuty endpoint where to subscribe CRITICAL alarms."
  type        = string
  default     = ""
}

variable "pager_duty_degraded_endpoint" {
  description = "(Optional) The PagerDuty endpoint where to subscribe DEGRADED alarms."
  type        = string
  default     = ""
}

variable "container_name" {
  description = "Optional name to use for the for the container. (`var.name_prefix` is used by default.)"
  default     = ""
  type        = string
}

variable "cluster_name" {
  description = "The Name of the ECS cluster to create the ECS service in."
  type        = string
}

variable "cluster_arn" {
  description = "The ARN of the ECS cluster to create the ECS service in."
  type        = string
}

variable "task_placement_constraints" {
  description = "A list of placement constraints to apply to the ECS task."
  default     = []
}

variable "task_container_image" {
  description = "The image used to start a container."
  type        = string
}

variable "task_port_mappings" {
  description = "An optional list of container ports to expose on the external host."
  type = list(object({
    host      = number
    container = number
  }))
  default = []
}

variable "desired_count" {
  description = "The number of instances of the task definitions to place and keep running."
  default     = 1
  type        = number
}

variable "task_cpu" {
  description = "Amount of CPU to reserve for the task."
  default     = 512
  type        = number
}

variable "task_memory" {
  description = "The soft limit (in MiB) of memory to reserve for the container."
  default     = 512
  type        = number
}


variable "task_container_command" {
  description = "The command that is passed to the container."
  default     = []
  type        = list(string)
}

variable "task_container_environment" {
  description = "The environment variables to pass to a container."
  default     = {}
  type        = map(string)
}

variable "task_container_secrets" {
  description = "The secret variables from Parameter Store or Secrets Manager to pass to a container."
  default     = {}
  type        = map(string)
}

variable "log_retention_in_days" {
  description = "Number of days the logs will be retained in CloudWatch."
  default     = 30
  type        = number
}

# https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_HealthCheck.html
variable "task_container_health_check" {
  description = "An object representing a container health check."
  default     = null
  type        = any
}

variable "deployment_minimum_healthy_percent" {
  default     = 50
  description = "The lower limit of the number of running tasks that must remain running and healthy in a service during a deployment."
  type        = number
}

variable "deployment_maximum_percent" {
  default     = 200
  description = "The upper limit of the number of running tasks that can be running in a service during a deployment."
  type        = number
}

variable "deployment_controller_type" {
  default     = "ECS"
  type        = string
  description = "Type of deployment controller. Valid values: CODE_DEPLOY, ECS, EXTERNAL."
}

variable "wait_for_steady_state" {
  default     = false
  description = "Whether to wait for the ECS service to reach a steady state."
  type        = bool
}

variable "service_alarm_cpu_evaluation_periods" {
  description = "number of evaluation periods before triggering alarm"
  default     = 5
}

variable "service_alarm_latency_threshold" {
  description = "Alarm threshold for high latency (milliseconds)"
  default     = 2000
}

variable "service_alarm_memory_threshold" {
  description = "Alarm threshold for High memory usage (percent)"
  default     = 80
}

variable "service_alarm_cpu_threshold" {
  description = "Alarm threshold for High CPU usage (percent)"
  default     = 80
}

variable "allowed_decrypt_kms_arns" {
  description = "A list of KMS ARNs used by the ECS Task."
  default     = []
}

variable "allowed_publish_sns_arns" {
  description = "A list of SNS Topic ARNs used by the ECS Task."
  default     = []
}

############################
# Configure ElasticCloud
############################
variable "elasticcloud_function_name" {
  description = "Name of lambda that should send Cloudwatch Logs to ElasticCloud"
  default     = "LogsToElasticsearch"
}

variable "elasticcloud_enabled" {
  description = "Enable forwarding logs from Cloudwatch Logs to ElasticCloud"
  default     = true
}