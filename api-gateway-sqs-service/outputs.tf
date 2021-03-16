output "api_gateway_sqs_role" {
  description = "The role to use when calling sqs from the api"
  value       = module.api-gateway-sqs-roles.api_gateway_sqs_role
}