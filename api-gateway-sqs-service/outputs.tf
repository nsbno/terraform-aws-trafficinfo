output "api_gateway_sqs_role" {
  description = "The role to use when calling sqs from the api"
  value       = aws_iam_role.api_gateway_sqs_role
}