variable "environment" {
  description = "Name of the environment, Ex. dev, test ,stage, prod."
  type        = string
}

variable "desired_count" {
  description = "Desired number of container instances of the service to run."
  default     = 1
  type        = number
}

variable "name_prefix" {
  description = "A prefix used for naming resources."
}

variable "service_name" {
  description = "the microservice name"
}

variable "service_port" {
  description = "the exposed port of the microservice."
}

variable "ecs_cluster" {
  description = "the cluster to deploy to"
}

variable "vpc" {
  description = "the vpc to use"
}

variable "task_container_image" {
  description = "the Docker image to deploy"
}

variable "task_container_port" {
  description = "the exposed port of the Docker image"
}

variable "task_definition_memory" {
  description = "Memory soft limit"
  default     = 512
}

variable "task_definition_cpu" {
  description = "CPU soft limit"
  default     = 256
}

variable "health_check_grace_period_seconds" {
  default     = 30
  description = "Seconds to ignore failing load balancer health checks on newly instantiated tasks to prevent premature shutdown, up to 7200. Only valid for services configured to use load balancers."
  type        = number
}

variable "health_check_path" {
  description = "the path to call for health check"
}

variable "health_check_port" {
  description = "the port tp call for health check"
}

variable "health_check_healthy_threshold" {
  default     = 3
  description = "The number of consecutive health checks successes required before considering an unhealthy target healthy."
  type        = number
}

variable "health_check_unhealthy_threshold" {
  default     = 3
  description = "The number of consecutive health check failures required before considering a target unhealthy."
  type        = number
}

variable "health_check_timeout" {
  default     = 5
  description = "The amount of time, in seconds, during which no response means a failed health check."
  type        = number
}

variable "health_check_interval" {
  default     = 30
  description = "The approximate amount of time in seconds between health checks of an individual target."
  type        = number
}

variable "enable_execute_command" {
  description = "Specifies whether to enable Amazon ECS Exec for the tasks within the service."
  type        = bool
  default     = false
}

variable "lbs" {
  description = "Map of identifier to LB configuration. The key must be a string, while the value must be an object containing the keys arn, arn_suffix, listener_arn and security_group_id."
  type        = map(object({ arn = string, arn_suffix = string, listener_arn = string, security_group_id = string }))
}

variable "alb_priority" {
  description = "aws_lb_listener_rule priority for routing."
}

variable "current_account" {
  description = "account number of current identity"
}

variable "tags" {
  type = map(string)
}

variable "application-config" {
  description = "The application config for the microservice"
}

variable "schema" {
  description = "API gateway schema, swagger or openapi document"
}

variable "base_path" {
  description = "API gateway base path mapping."
}

variable "domain_name" {
  description = "API gateway domain name"
}

variable "sqs_queues" {
  type    = list(string)
  default = []
}

variable "sqs_queues_write" {
  type    = list(string)
  default = []
}

variable "encryption_keys" {
  type    = list(string)
  default = []
}

variable "sns_publish_topics" {
  type    = list(string)
  default = []
}

variable "sns_subscribe_topics" {
  type    = list(string)
  default = []
}

variable "dynamodb_tables" {
  type    = list(string)
  default = []
}

variable "rds_enabled" {
  type    = string
  default = ""
}

variable "s3_read_buckets" {
  type    = list(string)
  default = []
}

variable "s3_write_buckets" {
  type    = list(string)
  default = []
}

variable "s3_delete_buckets" {
  type    = list(string)
  default = []
}

variable "lambda_elasticcloud" {
  description = "Lambda for sending logs to elastic cloud"
  default     = ""
}

variable "enable_elasticcloud" {
  description = "set to true to enable elastic cloud for this microservice"
  default     = false
  type        = bool
}

# Our own Trafficinfo Cognito instance.
variable "user_pool_id" {
  description = "The ID of the userpool to add resource server and app client for the microservice."
  default     = ""
}

variable "hosted_zone_name" {
  description = "Hosted Zone Name."
  type        = string
}

# Enable to create a resource server representing the microservice used when
# communicating TO the microservice.
# the resource service is used to create scopes for other clients to request when
# performing authorization and authentication to communicating with the microservice
# Scopes is in effect roles in OAuth world that a client can request and if
# authorized can use when requesting the service.
variable "create_resource_server" {
  description = "Create resource server in Cognito for microservice."
  default     = false
  type        = bool
}

variable "cognito_resource_server_identifier_base" {
  description = "The base identifier used by resource servers created by esc-microservice module."
  default     = ""
}

variable "resource_server_scopes" {
  description = "Scopes to add to resource server."
  type        = map(any)
  default = {
    scope = {
      "scope_name" : "access"
      "scope_description" : "Default Microservice access scope."
    }
  }
}

# Create Cognito App Client used when communication FROM the microservice
# to other services.
variable "create_app_client" {
  description = "Create application client in Cognito for microservice."
  default     = false
  type        = bool
}

# What scopes the client should have access to.
variable "app_client_scopes" {
  description = "Scopes to add to microservice default app_client."
  type        = list(string)
  default     = []
}

variable "use_elasticache" {
  description = "Use elasticache for caching in microservice"
  type        = bool
  default     = false
}

variable "cache_node_type" {
  description = "cache node type"
  default     = "cache.t2.small"
}

variable "cache_automatic_failover_enabled" {
  description = "cache automatic failover enabled"
  default     = false
  type        = bool
}

variable "cache_number_cache_clusters" {
  description = "number of nodes in the cache cluster"
  default     = 1
}

variable "redis_engine_version" {
  description = "What elasticache engine version to use."
  default = "5.0.5"
}

variable "redis_parameter_group_name" {
  default = "default.redis5.0"
  description = "What parameter group name to use for Redis instance."
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

variable "num_errors_logged_threshold" {
  description = "Alarm threshold value. Default is 50 errors."
  type        = number
  default     = 50
}

variable "num_errors_logged_period" {
  description = "Alarm period in seconds. Default is 1 minute."
  type        = number
  default     = 60
}

##############################################
# Configure Grafana Dashboard generation.
#
##############################################
variable "grafana_db_instance_identifier" {
  description = "(Optional) Specify db instance identifier to create grafana dashboard."
  type        = string
  default     = ""
}

variable "grafana_create_dashboard" {
  description = "(Optional) If should create Grafana Dashboard for application."
  type        = bool
  default     = false
}

##############################################
# Configure Delegated Cognito config generation.
# When enabling the most of the other cognito_central should be
# set with correct values for the ecs-microservice to do its thing.
#
##############################################
variable "cognito_central_enable" {
  description = "(Optional) Use the Central Cognito instance. Default is False."
  type        = bool
  default     = false
}

variable "cognito_local_enable" {
  description = "(Optional) Use the Local Cognito instance. Default is True."
  type        = bool
  default     = true
}

variable "cognito_central_bucket" {
  description = "(Optional) Configure where to upload delegated cognito config. Default is vydev-delegated-cognito-staging."
  type        = string
  default     = "vydev-delegated-cognito-staging"
}

variable "cognito_central_env" {
  description = "(Optional) Override which env to upload to for delegated cognito, default is the \"envirnment\"-variable."
  type        = string
  default     = ""
}

variable "cognito_central_account_id" {
  description = "(Optional) Set cognito account id from where to read the Client ID and Client Secret from."
  type        = string
  default     = ""
}

variable "cognito_central_user_pool_id" {
  description = "(Optional) The ID of the User Pool in central cognito to create resource server and app client in."
  type        = string
  default     = ""
}

variable "cognito_central_resource_server_identifier" {
  description = "(Optional) Override the base identifier used by resource servers created by esc-microservice module in the central cognito."
  type        = string
  default     = ""
}

variable "default_production_environment" {
  type    = string
  default = "prod"
}

##############################################
# Toggle X-Ray tracing for microservice in API-Gateway
#
##############################################
variable "api_gateway_enable_xray" {
  description = "Used to enable xray tracing in api gateway, default false"
  type        = bool
  default     = false
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

variable "alarms_to_slack_function_name" {
  description = "The name of the lambda function that sends alarms to slack ({var.name_prefix}-infra_alarms_to_slack)"
  type        = string
}

##############################################
# Access log for API-Gateway
#
##############################################

variable "access_log_retention_in_days" {
  description = "The number of days to preserve the access log entries. If 0, the events in the log group will never expire"
  type        = number
  default     = 14
}

### Container environment variables
variable "task_container_environment" {
  description = "Environment variables to inject into the container"
  type        = map(string)
  default     = {}
}

### Ephemeral storage amount
variable "size_in_gib" {
  description = "The total amount of ephemeral storage available, beyond the default amount. Must be between 21 and 200"
  type        = number
  default     = null
}