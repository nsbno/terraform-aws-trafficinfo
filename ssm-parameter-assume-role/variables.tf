variable "name_prefix" {
  description = "A prefix used for naming resources."
}
variable "tags" {
  description = "A map of tags (key-value pairs) passed to resources."
  type        = map(string)
  default     = {}
}
variable "slack_webhook" {
  description = "Slack Webhook URL for recieving notification"
}