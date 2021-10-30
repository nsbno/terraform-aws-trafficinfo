output "ecs-fargate-microservice" {
  description = "The microservice definition"
  value       = module.ecs_fargate_microservice
}

output "api_gateway_rest_api" {
  description = "The API created in the API Gateway for microservice."
  value       = aws_api_gateway_rest_api.api_gateway_microservice_rest_api
}

output "api_gateway_deployment" {
  description = "The Deployment created in the API Gateway for microservice."
  value       = aws_api_gateway_deployment.api_gateway_microservice_rest_api_deployment_v1
}

output "critical_alarm_topic_arn" {
  value = aws_sns_topic.critical_alarms.arn
}

output "degraded_alarm_topic_arn" {
  value = aws_sns_topic.degraded_alarms.arn
}