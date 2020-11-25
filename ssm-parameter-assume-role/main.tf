data "aws_region" "current" {}
data "aws_caller_identity" "current" {}
locals {
  current_account_id = data.aws_caller_identity.current.account_id
  current_region     = data.aws_region.current.name
}
resource "aws_ssm_parameter" "slack_webhook" {
  name        = "/slack_webhook/webhookurl"
  description = "The Slack Webhook URL"
  type        = "String"
  value       = var.slack_webhook
  tags        = var.tags
}
resource "aws_iam_role" "iam_for_assuming_role" {
  assume_role_policy = data.aws_iam_policy_document.crossaccount-assume-role-policy.json
  description        = "Allow master account-lambda role to get a parameter"
  tags               = var.tags
}
resource "aws_iam_policy" "get_ssm_parameter" {
  name        = "Get_SSM_Parameter"
  description = "Get webhook url parameter"

  policy = data.aws_iam_policy_document.ssm-policies.json
}
resource "aws_iam_role_policy_attachment" "put-metrics" {
    role = aws_iam_role.iam_for_assuming_role.name
    policy_arn = aws_iam_policy.get_ssm_parameter.arn
}
resource "aws_kms_key" "slack_webhook_url" {
  description             = "KMS key for Slack webhook-url parameter"
  deletion_window_in_days = 10
}
resource "aws_kms_alias" "alias" {
  name          = "alias/slack-webhook-url"
  target_key_id = aws_kms_key.slack_webhook_url.key_id
}