output "api_gateway_execution_role" {
  description = "The role to use when calling sqs from the api"
  value       = aws_iam_role.execution_role.arn
}
