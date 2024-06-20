variable "name_prefix" {
  description = "A prefix used for naming resources."
}

variable "service_name" {
  description = "the microservice name"
}

variable "stage_name" {
  description = "the stage name"
}

variable "logging_level" {
  description = "Set level of loggin for Rest API"
  default     = "ERROR"
}

variable "logenabled" {
  description = "Enable trace and metrics"
  default     = "false"
}

variable "cognito_user_pool_arn" {
  description = "Arn for use user pool"
}

variable "tags" {
  type = map(string)
}

variable "api_gateway_enable_xray" {
  description = "Used to enable xray tracing in api gateway, default false"
  type        = bool
  default     = false
}

variable "schema" {
  description = "API gateway schema, swagger or openapi document"
}

variable "api_key_required" {
  type        = bool
  description = "Specify if an API key is required."
  default     = false
}

variable "authorization" {
  type        = string
  description = "The type of authorization used to authenticate requests.  Valid values are NONE or COGNITO_USER_POOLS."
  default     = "NONE"
}

variable "execution_arn" {
  type        = string
  description = "The ARN of the streams the role is allowed to read from"
}

variable "timeout_milliseconds" {
  type        = number
  description = "Custom timeout between 50 and 29,000 milliseconds."
  default     = "29000"
}

variable "streamname" {
  type        = string
  description = "The name of the streams to write to"
}

