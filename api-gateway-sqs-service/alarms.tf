resource "aws_cloudwatch_metric_alarm" "high_latency" {
  metric_name         = "IntegrationLatency"
  alarm_name          = "${var.name_prefix}-${var.service_name}-latency"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 5
  threshold           = var.service_alarm_latency_treshold
  namespace           = "AWS/ApiGateway"
  dimensions = {
    ApiName = "${var.name_prefix}-${var.service_name}"
  }
  period             = 60
  statistic          = "Average"
  alarm_description  = "${var.name_prefix}-${var.service_name} latency is above configured treshold"
  tags               = var.tags
  alarm_actions      = var.alarms_sns_topic_arn
  ok_actions         = var.alarms_sns_topic_arn
  treat_missing_data = "notBreaching"
}

resource "aws_cloudwatch_metric_alarm" "num_errors_service" {
  metric_name         = "5XXError"
  alarm_name          = "${var.name_prefix}-${var.service_name}-errors-service"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  threshold           = var.service_alarm_error_response_treshold
  namespace           = "AWS/ApiGateway"
  dimensions = {
    ApiName = "${var.name_prefix}-${var.service_name}"
  }
  period             = 60
  statistic          = "Average"
  alarm_description  = "${var.name_prefix}-${var.service_name} has crossed the 5xx error treshold"
  tags               = var.tags
  alarm_actions      = var.alarms_sns_topic_arn
  ok_actions         = var.alarms_sns_topic_arn
  treat_missing_data = "notBreaching"
}