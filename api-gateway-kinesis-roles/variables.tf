variable "name_prefix" {
  description = "A prefix used for naming resources."
}

variable "tags" {
  description = "A map of tags (key-value pairs) passed to resources."
  type        = map(string)
  default     = {}
}

variable "kinesis_arn" {
  description = "The ARN of the streams the role is allowed to read from"
}

variable "service_name" {
  description = "the microservice name"
}

