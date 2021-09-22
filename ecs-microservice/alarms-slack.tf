############################################################################################
# Integrate Cloudwatch Alarms to Slack notifications via SNS topics and custom Lambda.
############################################################################################
# Lambda to send notification of alarms to Slack.
data "aws_lambda_function" "alarms_to_slack" {
  function_name = "${var.name_prefix}-infra_alarms_to_slack"
}

# Permission to lambda to invoke from SNS degraded_alarms
resource "aws_lambda_permission" "permission_invoke_alarms_to_slack_to_sns_degraded_alarms" {
  action        = "lambda:InvokeFunction"
  function_name = data.aws_lambda_function.alarms_to_slack.arn
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.degraded_alarms.arn
}

# Permission to lambda to invoke from SNS critical_alarms
resource "aws_lambda_permission" "permission_invoke_alarms_to_slack_to_sns_critical_alarms" {
  action        = "lambda:InvokeFunction"
  function_name = data.aws_lambda_function.alarms_to_slack.arn
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.critical_alarms.arn
}

# Subscribe SNS Topic for Critical Alarms to lambda.
resource "aws_sns_topic_subscription" "critical_alarms_to_slack_subscription" {
  endpoint  = data.aws_lambda_function.alarms_to_slack.arn
  protocol  = "lambda"
  topic_arn = aws_sns_topic.critical_alarms.arn
}

# Subscribe SNS Topic for Degraded Alarms to lambda.
resource "aws_sns_topic_subscription" "degraded_alarms_to_slack_subscription" {
  endpoint  = data.aws_lambda_function.alarms_to_slack.arn
  protocol  = "lambda"
  topic_arn = aws_sns_topic.degraded_alarms.arn
}

# Subscribe SNS Topic for Critical Alarms to lambda.
resource "aws_sns_topic_subscription" "subscribe_alarms_to_slack_to_sns_critical_alarms" {
  endpoint  = data.aws_lambda_function.alarms_to_slack.arn
  protocol  = "lambda"
  topic_arn = aws_sns_topic.critical_alarms.arn
}