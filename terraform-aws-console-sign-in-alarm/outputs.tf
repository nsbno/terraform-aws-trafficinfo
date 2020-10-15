output "cloudwatch_event" {
  value = aws_cloudwatch_event_rule.console.arn
}