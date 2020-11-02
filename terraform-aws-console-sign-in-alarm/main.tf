###Console sign-in Events can be detected by cloudwatch_event only on the US EAST###

provider "aws" {
  alias   = "us_east"
}
data "aws_caller_identity" "current" {}

locals {
  current_account_id = data.aws_caller_identity.current.account_id
}

data "archive_file" "this" {
  type        = "zip"
  source_file = "${path.module}/src/lambda_function.py"
  output_path = "${path.module}/src/lambda_send_slack.zip"
}

resource "aws_cloudwatch_event_rule" "console" {
  name        = "${var.name_prefix}-capture-aws-sign-in"
  description = "Capture each AWS Console Sign In"

  event_pattern = <<EOF
{
  "detail-type": [
    "AWS Console Sign In via CloudTrail"
  ]
}
EOF
  tags = var.tags
}

#####Sending SNS notification#####

resource "aws_cloudwatch_event_target" "sns" {
  count = var.sns_mobile != "" ? 1 : 0
  rule      = aws_cloudwatch_event_rule.console.name
  target_id = "SendToSNS"
  arn       = aws_sns_topic.aws_logins[count.index].arn
}

resource "aws_sns_topic" "aws_logins" {
  count = var.sns_mobile != "" ? 1 : 0
  name = "${var.name_prefix}-aws-console-logins"
}

resource "aws_sns_topic_policy" "default" {
  count = var.sns_mobile != "" ? 1 : 0
  arn    = aws_sns_topic.aws_logins[count.index].arn
  policy = data.aws_iam_policy_document.sns_topic_policy[count.index].json
}

resource "aws_sns_topic_subscription" "sms" {
  count = var.sns_mobile != "" ? 1 : 0
  topic_arn = aws_sns_topic.aws_logins[count.index].arn
  protocol  = "sms"
  endpoint  = var.sns_mobile
}
#####Lambda Function for sending notification to Slack#####

resource "aws_lambda_function" "slack_lambda" {
  filename      = data.archive_file.this.output_path
  function_name = "${var.name_prefix}-lambda_sendto_slack"
  description   = "Sending an alarm to Slack Channel when a user signed-in"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "lambda_function.lambda_handler"
  source_code_hash = filebase64sha256(data.archive_file.this.output_path)
  runtime = "python3.7"
  environment {
    variables = {
      HookUrl = var.hook_url
    }
  }
}
resource "aws_iam_role" "iam_for_lambda" {
  assume_role_policy = data.aws_iam_policy_document.lambda_assume.json
  description        = "Execution role for Lambda function that forwards CloudWatch Alarms to Slack"
  tags               = var.tags
}
resource "aws_iam_role_policy_attachment" "cloudwatch-write" {
    role = aws_iam_role.iam_for_lambda.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
resource "aws_iam_policy" "put_metrics" {
  name        = "CloudWatch_Put_Metrics"
  description = "Put Metrics"

  policy = data.aws_iam_policy_document.lambda_put_metrics.json
}
resource "aws_iam_role_policy_attachment" "put-metrics" {
    role = aws_iam_role.iam_for_lambda.name
    policy_arn = aws_iam_policy.put_metrics.arn
} 
resource "aws_iam_policy" "list_alias" {
  name        = "List_Account_Alias"
  description = "Listing account's aliases"

  policy = data.aws_iam_policy_document.lambda_list_alias.json
}
resource "aws_iam_role_policy_attachment" "list_alias" {
    role = aws_iam_role.iam_for_lambda.name
    policy_arn = aws_iam_policy.list_alias.arn
}
resource "aws_cloudwatch_event_target" "slack" {
  rule      = aws_cloudwatch_event_rule.console.name
  target_id = "SendToSlackChannel"
  arn       = aws_lambda_function.slack_lambda.arn
}
resource "aws_lambda_permission" "allow_cloudwatch" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.slack_lambda.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.console.arn
}