data "aws_iam_policy_document" "lambda_assume" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      identifiers = ["lambda.amazonaws.com"]
      type        = "Service"
    }
  }
}
data "aws_iam_policy_document" "sns_topic_policy" {
  count = var.sns_mobile != "" ? 1 : 0
  statement {
    effect  = "Allow"
    actions = ["SNS:Publish"]

    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }

    resources = [aws_sns_topic.aws_logins[count.index].arn]
  }
}
data "aws_iam_policy_document" "lambda_put_metrics" {
  statement {
    effect  = "Allow"
    actions = ["cloudwatch:PutMetricData"]
    resources = [
            "*",
        ]
  }
}
data "aws_iam_policy_document" "lambda_list_alias" {
  statement {
    effect  = "Allow"
    actions = ["iam:ListAccountAliases"]
    resources = [
            "*",
        ]
  }
}