data "aws_iam_policy_document" "crossaccount-assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::276520083766:role/LambdaExe-CliLogin-Notification"]
    }
  }
}
data "aws_iam_policy_document" "ssm-policies" {
  statement {
            actions = ["ssm:GetParameter", "ssm:GetParameters"]
            resources = ["arn:aws:ssm:${local.current_region}:${local.current_account_id}:parameter/slack_webhook/*"]
        }
 statement {
            actions = ["ssm:DescribeParameters",]
            resources = ["arn:aws:ssm:${local.current_region}:${local.current_account_id}:*",]
        }
 statement {
            actions = ["kms:Decrypt",]
            resources = ["arn:aws:kms:${local.current_region}:${local.current_account_id}:key/slack-webhook-url",]
        }     
}
