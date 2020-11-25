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
   
            principals {
              type        = "Service"
              identifiers = ["ssm.amazonaws.com"]
            }
            actions = ["ssm:GetParameter",]
            resources = ["arn:aws:ssm:::${local.current_region}:${local.current_account_id}:parameter/slack_webhook/*"]
        }
 statement {

            principals {
              type        = "Service"
              identifiers = ["ssm.amazonaws.com"]
            }
            actions = ["ssm:DescribeParameters",]
            resources = ["arn:aws:ssm:eu-west-1:${local.current_account_id}:*",]
        }
 statement {

            principals {
              type        = "Service"
              identifiers = ["kms.amazonaws.com"]
            }
            actions = ["kms:Decrypt",]
            resources = ["arn:aws:kms:eu-west-1:${local.current_account_id}:key/alias/slack-webhook-url",]
        }     
}