variable "name_prefix" {
  description = "A prefix used for naming resources."
}

variable "service_name" {
  description = "the microservice name"
}

variable "sqs_integration_arn" {
  description = "ARN of SQS queue to send to"
}