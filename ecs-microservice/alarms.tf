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
  alarm_actions     = var.alarms_sns_topic_arn
  ok_actions        = var.alarms_sns_topic_arn
}

resource "aws_cloudwatch_metric_alarm" "high_cpu_utilization" {
  metric_name         = "CPUUtilization"
  alarm_name          = "${var.name_prefix}-${var.service_name}-cpu"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.service_alarm_cpu_evaluation_periods
  threshold           = 80
  namespace           = "AWS/ECS"
  dimensions = {
    ClusterName = var.ecs_cluster.name
    ServiceName = "${var.name_prefix}-${var.service_name}"
  }
  period            = 60
  statistic         = "Average"
  alarm_description = "${var.name_prefix}-${var.service_name} has crossed the CPU usage treshold"
  tags              = var.tags
  alarm_actions     = var.alarms_sns_topic_arn
  ok_actions        = var.alarms_sns_topic_arn
}

resource "aws_cloudwatch_metric_alarm" "high_memory_utilization" {
  metric_name         = "MemoryUtilization"
  alarm_name          = "${var.name_prefix}-${var.service_name}-memory"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 5
  threshold           = var.service_alarm_memory_treshold
  namespace           = "AWS/ECS"
  dimensions = {
    ClusterName = var.ecs_cluster.name
    ServiceName = "${var.name_prefix}-${var.service_name}"
  }
  period            = 60
  statistic         = "Average"
  alarm_description = "${var.name_prefix}-${var.service_name} has crossed the memory usage treshold"
  tags              = var.tags
  alarm_actions     = var.alarms_sns_topic_arn
  ok_actions        = var.alarms_sns_topic_arn
}

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
  threshold           = 50
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
  alarm_actions      = var.alarms_sns_topic_arn
  ok_actions         = var.alarms_sns_topic_arn
  treat_missing_data = "notBreaching"
}
