############################################################################################
# Integrate Cloudwatch Alarms to CloudWatch Metrics via SNS topics and custom Lambda.
############################################################################################
# This lambda publish metrics of alarms as custom metrics in CloudWatch Metrics.
data "aws_lambda_function" "alarms_to_metrics" {
  function_name = "${var.name_prefix}-alarms-to-metrics"
}

# Permission to lambda to invoke from SNS degraded_alarms
resource "aws_lambda_permission" "permission_invoke_alarms_to_metrics_to_sns_degraded_alarms" {
  statement_id  = "AllowInvokeFromDegradedAlarmsSNS"
  action        = "lambda:InvokeFunction"
  function_name = data.aws_lambda_function.alarms_to_metrics.arn
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.degraded_alarms.arn
}

# Permission to lambda to invoke from SNS critical_alarms
resource "aws_lambda_permission" "permission_invoke_alarms_to_metrics_to_sns_critical_alarms" {
  statement_id  = "AllowInvokeFromCriticalAlarmsSNS"
  action        = "lambda:InvokeFunction"
  function_name = data.aws_lambda_function.alarms_to_metrics.arn
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.critical_alarms.arn
}

# Subscribe SNS Topic for Critical Alarms to lambda.
resource "aws_sns_topic_subscription" "critical_alarms_to_metrics_subscription" {
  endpoint  = data.aws_lambda_function.alarms_to_metrics.arn
  protocol  = "lambda"
  topic_arn = aws_sns_topic.critical_alarms.arn
}

# Subscribe SNS Topic for Degraded Alarms to lambda.
resource "aws_sns_topic_subscription" "degraded_alarms_to_metrics_subscription" {
  endpoint  = data.aws_lambda_function.alarms_to_metrics.arn
  protocol  = "lambda"
  topic_arn = aws_sns_topic.degraded_alarms.arn
}

# Subscribe SNS Topic for Critical Alarms to lambda.
resource "aws_sns_topic_subscription" "subscribe_alarms_to_metrics_to_sns_critical_alarms" {
  endpoint  = data.aws_lambda_function.alarms_to_metrics.arn
  protocol  = "lambda"
  topic_arn = aws_sns_topic.critical_alarms.arn
}