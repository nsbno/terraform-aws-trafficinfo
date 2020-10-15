variable "name_prefix" {
  description = "A prefix used for naming resources."
}
variable "hook_url" {
    description = "A Slack Webhook URL for sending cloudwatch event to"
    default     = ""
}
variable "tags" {
  description = "A map of tags (key-value pairs) passed to resources."
  type        = map(string)
  default     = {}
}
variable "sns_mobile" {
    description = "SMS to receive SNS notification for sign-in user"
    type        = string
    default     = ""
}