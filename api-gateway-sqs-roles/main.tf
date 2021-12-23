# Create roles that allows for an integration between Application Gateway and SQS (where the gateway posts incoming requests to SQS).

resource "aws_iam_role" "api_gateway_sqs_role" {
  name = "${var.name_prefix}-${var.service_name}-apigateway-sqs"

  assume_role_policy = data.aws_iam_policy_document.gateway_assume_role.json
}

data "aws_iam_policy_document" "gateway_assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      identifiers = ["apigateway.amazonaws.com"]
      type        = "Service"
    }
  }
}

data "aws_iam_policy_document" "api_gateway_sqs_policy" {
  statement {
    effect  = "Allow"
    actions = [
      "sqs:SendMessage"
    ]
    resources = [var.sqs_integration_arn]
  }

  statement {
    effect  = "Allow"
    actions = [
      "sqs:ListQueues"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "api_policy" {
  name = "${var.name_prefix}-${var.service_name}-apigateway-sqs-policy"

  policy = data.aws_iam_policy_document.api_gateway_sqs_policy.json
}


resource "aws_iam_role_policy_attachment" "api_exec_role" {
  role       =  aws_iam_role.api_gateway_sqs_role.name
  policy_arn =  aws_iam_policy.api_policy.arn
}

resource "aws_iam_role_policy" "cloudwatch" {
  name = "${var.name_prefix}-${var.service_name}-cloudwatch-policy"
  role = aws_iam_role.api_gateway_sqs_role.id

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:DescribeLogGroups",
                "logs:DescribeLogStreams",
                "logs:PutLogEvents",
                "logs:GetLogEvents",
                "logs:FilterLogEvents"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}
