variable "name_prefix" {
}

variable "ssm_prefix" {
  description = "(Optional) An SSM prefix to use for the parameters containing the IAM user's access keys (e.g., `/<name-prefix>/<application-name>`)."
  default     = ""
}

variable "machine_user_parameters_key" {
  default = ""
}

variable "allowed_s3_count" {
  default = 0
}

variable "allowed_read_s3_count" {
  default = 0
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

variable "allowed_read_and_delete_s3_count" {
  default = 0
}

variable "allowed_sqs_arns" {
  default = []
}

variable "allowed_sqs_count" {
  default = 0
}

variable "allowed_kms_arns" {
  default = []
}

variable "allowed_kms_count" {
  default = 0
}

variable "allowed_decrypt_kms_arns" {
  default = []
}

variable "allowed_decrypt_kms_count" {
  default = 0
}

variable "allowed_pull_sqs_count" {
  default = 0
}

variable "allowed_pull_sqs_arns" {
  default = []
}

variable "allowed_temporary_queue_response_sqs_count" {
  default = 0
}

variable "allowed_temporary_queue_response_sqs_arns" {
  default = []
}

variable "allowed_temporary_queue_request_sqs_count" {
  default = 0
}

variable "allowed_temporary_queue_request_sqs_arns" {
  default = []
}

variable "allowed_ssm_arns" {
  default     = []
  description = "Paths in System Manager Parameter Store that the external user is allowed to read."
}

variable "cloudwatch_metrics_access" {
  default = false
  description = "Toggle to give access to pushing cloudwatch metrics"
}