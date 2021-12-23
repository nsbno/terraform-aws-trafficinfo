variable "name_prefix" {
  description = "A prefix used for naming resources."
}

variable "service_name" {
  description = "the microservice name"
}

variable "schema" {
  description = "API gateway schema, swagger or openapi document"
}

variable "domain_name" {
  description = "API gateway domain name"
}

variable "base_path" {
  description = "API gateway base path mapping."
}

variable "sqs_integration_arn" {
  description = "ARN of SQS queue to send to"
}

variable "logging_level" {
  description = "Set level of loggin for Rest API"
  default     = "ERROR"
}

variable "logenabled" {
  description = "Enable trace and metrics"
  default     = "false"
}

variable "cognito_resource_server_identifier_base" {
  description = "The base identifier used by resource servers created by esc-microservice module."
}

variable "user_pool_id" {
  description = "The ID of the userpool to add resource server and app client for the microservice."
  default     = ""
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

variable "tags" {
  type = map(string)
}

variable "alarms_sns_topic_arn" {
  type        = list(string)
  description = "The arn(s) of the SNS topic(s) for the alarm to publish to"
  default     = []
}

variable "service_alarm_latency_treshold" {
  description = "threshold for latency alarm in milliseconds"
  default     = 2000
}

variable "service_alarm_error_response_treshold" {
  description = "threshold for number of error responses"
  default     = 50
}

variable "api_gateway_enable_xray" {
  description = "Used to enable xray tracing in api gateway, default false"
  type        = bool
  default     = false
}