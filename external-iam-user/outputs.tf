output "user_name" {
  description = "The name of the IAM user."
  value       = aws_iam_user.ext_machine_user.name
}

output "user_arn" {
  description = "The ARN of the IAM user."
  value       = aws_iam_user.ext_machine_user.arn
}
