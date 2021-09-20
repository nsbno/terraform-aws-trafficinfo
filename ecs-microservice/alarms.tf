# Alarm SNS topic for alarms on level DEGRADED.
resource "aws_sns_topic" "degraded_alarms" {
  name = "${var.name_prefix}-${var.service_name}-degraded-alarms"
  tags = var.tags
}

# Alarm SNS topic for alarms on level CRITICAL
resource "aws_sns_topic" "critical_alarms" {
  name = "${var.name_prefix}-${var.service_name}-critical-alarms"
  tags = var.tags
}

# Subscribe Critical alarms to PagerDuty
resource "aws_sns_topic_subscription" "critical_alarms_to_pagerduty" {
  count                  = var.pager_duty_critical_endpoint == "" ? 0 : 1
  endpoint               = var.pager_duty_critical_endpoint
  protocol               = "https"
  endpoint_auto_confirms = true
  topic_arn              = aws_sns_topic.critical_alarms.arn
}

# Subscribe Degraded alarms to PagerDuty
resource "aws_sns_topic_subscription" "degraded_alarms_to_pagerduty" {
  count                  = var.pager_duty_degraded_endpoint == "" ? 0 : 1
  endpoint               = var.pager_duty_degraded_endpoint
  protocol               = "https"
  endpoint_auto_confirms = true
  topic_arn              = aws_sns_topic.degraded_alarms.arn
}

# Lambda to send notification of alarms to Slack.
data "aws_lambda_function" "alarms_to_slack" {
  function_name    = "${var.name_prefix}-infra_alarms_to_slack"
}

# Permission to lambda to invoke from SNS degraded_alarms
resource "aws_lambda_permission" "permission_invoke_alarms_to_slack_to_sns_degraded_alarms" {
  statement_id  = "AllowExecutionFromSNS"
  action        = "lambda:InvokeFunction"
  function_name = data.aws_lambda_function.alarms_to_slack.arn
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.degraded_alarms.arn
}

# Permission to lambda to invoke from SNS critical_alarms
resource "aws_lambda_permission" "permission_invoke_alarms_to_slack_to_sns_critical_alarms" {
  statement_id  = "AllowExecutionFromSNS"
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

############################################################################################
# Configure Default Cloudwatch Alarms for service
############################################################################################
resource "aws_cloudwatch_metric_alarm" "service_unhealthy" {
  metric_name         = "UnHealthyHostCount"
  alarm_name          = "${var.name_prefix}-${var.service_name}-unhealthy"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  threshold           = 1
  namespace           = "AWS/ApplicationELB"
  dimensions = {
    TargetGroup  = module.ecs_fargate_microservice.target_group_arn_suffix
    LoadBalancer = var.alb.arn_suffix
  }
  period            = 60
  statistic         = "Average"
  alarm_description = "${var.name_prefix}-${var.service_name} service has unhealthy targets"
  tags              = var.tags
  alarm_actions     = var.alarms_critical_sns_topic_arn
  ok_actions        = var.alarms_critical_sns_topic_arn
}

resource "aws_cloudwatch_metric_alarm" "high_cpu_utilization" {
  metric_name         = "CPUUtilization"
  alarm_name          = "${var.name_prefix}-${var.service_name}-cpu"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.service_alarm_cpu_evaluation_periods
  threshold           = var.service_alarm_cpu_threshold
  namespace           = "AWS/ECS"
  dimensions = {
    ClusterName = var.ecs_cluster.name
    ServiceName = "${var.name_prefix}-${var.service_name}"
  }
  period            = 60
  statistic         = "Average"
  alarm_description = "${var.name_prefix}-${var.service_name} has crossed the CPU usage treshold"
  tags              = var.tags
  alarm_actions     = var.alarms_degraded_sns_topic_arn
  ok_actions        = var.alarms_degraded_sns_topic_arn
}

resource "aws_cloudwatch_metric_alarm" "high_memory_utilization" {
  metric_name         = "MemoryUtilization"
  alarm_name          = "${var.name_prefix}-${var.service_name}-memory"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 5
  threshold           = var.service_alarm_memory_threshold
  namespace           = "AWS/ECS"
  dimensions = {
    ClusterName = var.ecs_cluster.name
    ServiceName = "${var.name_prefix}-${var.service_name}"
  }
  period            = 60
  statistic         = "Average"
  alarm_description = "${var.name_prefix}-${var.service_name} has crossed the memory usage treshold"
  tags              = var.tags
  alarm_actions     = var.alarms_degraded_sns_topic_arn
  ok_actions        = var.alarms_degraded_sns_topic_arn
}

resource "aws_cloudwatch_metric_alarm" "high_latency" {
  metric_name         = "IntegrationLatency"
  alarm_name          = "${var.name_prefix}-${var.service_name}-latency"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 5
  threshold           = var.service_alarm_latency_threshold
  namespace           = "AWS/ApiGateway"
  dimensions = {
    ApiName = "${var.name_prefix}-${var.service_name}"
  }
  period             = 60
  statistic          = "Average"
  alarm_description  = "${var.name_prefix}-${var.service_name} latency is above configured treshold"
  tags               = var.tags
  alarm_actions      = var.alarms_degraded_sns_topic_arn
  ok_actions         = var.alarms_degraded_sns_topic_arn
  treat_missing_data = "notBreaching"
}

resource "aws_cloudwatch_metric_alarm" "num_errors_service" {
  metric_name         = "5XXError"
  alarm_name          = "${var.name_prefix}-${var.service_name}-errors-service"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  threshold           = 50
  namespace           = "AWS/ApiGateway"
  dimensions = {
    ApiName = "${var.name_prefix}-${var.service_name}"
  }
  period             = 60
  statistic          = "Average"
  alarm_description  = "${var.name_prefix}-${var.service_name} has crossed the 5xx error treshold"
  tags               = var.tags
  alarm_actions      = var.alarms_degraded_sns_topic_arn
  ok_actions         = var.alarms_degraded_sns_topic_arn
  treat_missing_data = "notBreaching"
}

resource "aws_cloudwatch_metric_alarm" "num_error_logs" {
  metric_name         = "logback.events.count"
  alarm_name          = "${var.name_prefix}-${var.service_name}-errors-log"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  threshold           = 50
  namespace           = "${var.name_prefix}-${var.service_name}"
  dimensions = {
    level = "error"
  }
  period             = 60
  statistic          = "Sum"
  alarm_description  = "${var.name_prefix}-${var.service_name} has logged to many errors"
  tags               = var.tags
  alarm_actions      = var.alarms_degraded_sns_topic_arn
  ok_actions         = var.alarms_degraded_sns_topic_arn
  treat_missing_data = "notBreaching"
}
