# Create roles that allows for an integration between Application Gateway and Kinesis (where the gateway posts incoming requests to Kinesis).

resource "aws_iam_role" "execution_role" {
  name               = "${var.name_prefix}-${var.service_name}-apigateway-kinesis-execution"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
  tags               = var.tags
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type = "Service"
      identifiers = [
        "apigateway.amazonaws.com"
      ]
    }
  }
}

data "aws_iam_policy_document" "execution_role" {

  statement {
    sid = "ListStreams"
    actions = [
      "kinesis:ListStreams"
    ]
    effect    = "Allow"
    resources = ["*"]
  }

  statement {
    sid = "DescribeStreamSummary"
    actions = [
      "kinesis:DescribeStreamSummary",
    ]
    effect    = "Allow"
    resources = [var.kinesis_arn,]
  }

  statement {
    sid = "ListShards"
    actions = [
      "kinesis:ListShards",
    ]
    effect    = "Allow"
    resources = [var.kinesis_arn,]
  }

  statement {
    sid = "GetRecords"
    actions = [
      "kinesis:GetRecords",
      "kinesis:GetShardIterator",
    ]
    effect    = "Allow"
    resources = [var.kinesis_arn,]
  }

  statement {
    sid = "PutRecord"
    actions = [
      "kinesis:PutRecord",
    ]
    effect    = "Allow"
    resources = [var.kinesis_arn,]
  }

  statement {
    sid = "PutRecords"
    actions = [
      "kinesis:PutRecords"
    ]
    effect    = "Allow"
    resources = [var.kinesis_arn,]
  }
}

resource "aws_iam_policy" "execution_role" {
  name   = "${var.name_prefix}-${var.service_name}-execution_role"
  path   = "/"
  policy = data.aws_iam_policy_document.execution_role.json
}

resource "aws_iam_role_policy_attachment" "execution_role" {
  role       = aws_iam_role.execution_role.name
  policy_arn = aws_iam_policy.execution_role.arn
}
