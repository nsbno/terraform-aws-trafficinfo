variable "name_prefix" {
}

variable "task_role_name" {
  description = "The name of the ECS task role to attach policies to."
}

variable "allowed_s3_arns" {
  default = []
}

variable "allowed_read_s3_arns" {
  default = []
}

variable "allowed_read_and_delete_s3_arns" {
  default = []
}

variable "allowed_sqs_arns" {
  default = []
}

variable "allowed_publish_sns_arns" {
  default = []
}

variable "allowed_kms_arns" {
  default = []
}

variable "allowed_decrypt_kms_arns" {
  default = []
}

variable "allowed_pull_sqs_arns" {
  default = []
}

variable "allowed_temporary_queue_response_sqs_arns" {
  default = []
}

variable "allowed_temporary_queue_request_sqs_arns" {
  default = []
}

variable "allowed_ssm_arns" {
  default     = []
  description = "Paths in System Manager Parameter Store that the role is allowed to read."
}

variable "cloudwatch_metrics_access" {
  default     = false
  description = "Toggle to give access to pushing cloudwatch metrics"
}
