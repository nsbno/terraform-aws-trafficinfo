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

variable "alarms_sns_topic_arn" {
  type        = list(string)
  description = "The arn(s) of the SNS topic(s) for the alarm to publish to"
  default     = []
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

variable "health_check_path" {
  description = "the path to call for health check"
}

variable "health_check_port" {
  description = "the port tp call for health check"
}

variable "alb" {
  description = "the load balancer to use"
}

variable "alb_http_listener" {
  description = "the http listener for the alb load balancer."
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

variable "lambda_elasticcloud" {
  description = "Lambda for sending logs to elastic cloud"
  default     = ""
}

variable "enable_elasticcloud" {
  description = "set to true to enable elastic cloud for this microservice"
  default     = false
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
  default     = 0
}

variable "cognito_resource_server_identifier_base" {
  description = "The base identifier used by resource servers created by esc-microservice module."
}

variable "resource_server_scopes" {
  description = "Scopes to add to resource server."
  type        = map
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
  default     = 0
}

# What scopes the client should have access to.
variable "app_client_scopes" {
  description = "Scopes to add to microservice default app_client."
  type        = list(string)
  default     = []
}

variable "use_elasticache" {
  description = "Use elasticache for caching in microservice"
  default     = 0
}

variable "cache_node_type" {
  description = "cache node type"
  default     = "cache.t2.small"
}

variable "cache_automatic_failover_enabled" {
  description = "cache automatic failover enabled"
  default     = false
}

variable "cache_number_cache_clusters" {
  description = "number of nodes in the cache cluster"
  default     = 1
}

variable "service_alarm_latency_treshold" {
  description = "threshold for latency alarm in milliseconds"
  default     = 2000
}

variable "service_alarm_cpu_evaluation_periods" {
  description = "number of evaluation periods before triggering alarm"
  default     = 5
}

variable "service_alarm_memory_treshold" {
  description = "threshold for memory usage"
  default     = 80
}

##############################################
# Configure Grafana Dashboard generation.
#
##############################################
variable "grafana_folder_name" {
  description = "(Optional) Override the name of the Grafana Folder to put Dashboard in."
  type        = string
  default     = ""
}

variable "grafana_use_existing_folder" {
  description = "(Optional) ID to an existing folder in Grafana to be used instead of creating a new one."
  type        = number
  default     = -1
}

variable "grafana_template_file" {
  description = "(Optional) Path to template for dashboard to provide a custom dashboard template."
  type        = string
  default     = ""
}

variable "grafana_create_dashboard" {
  description = "(Optional) If should create Grafana Dashboard for application."
  type        = bool
  default     = false
}
