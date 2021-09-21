############################################################################################
# Integrate Cloudwatch Alarms to Pagerduty via SNS topics.
############################################################################################
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