
resource "aws_iam_user" "ext_machine_user" {
  name          = "${var.name_prefix}-ext_machine_user"
  path          = "/machine-user/"
  force_destroy = true
}

resource "aws_iam_access_key" "ext_machine_user" {
  user = aws_iam_user.ext_machine_user.name
}

resource "aws_ssm_parameter" "ext_sqs_user_id" {
  name   = format("%s%s", var.ssm_prefix == "" ? "" : "${var.ssm_prefix}/", "${var.name_prefix}-ext-user-id")
  type   = "SecureString"
  value  = aws_iam_access_key.ext_machine_user.id
  key_id = var.machine_user_parameters_key
}

resource "aws_ssm_parameter" "ext_sqs_user_key" {
  name   = format("%s%s", var.ssm_prefix == "" ? "" : "${var.ssm_prefix}/", "${var.name_prefix}-ext-user-key")
  type   = "SecureString"
  value  = aws_iam_access_key.ext_machine_user.secret
  key_id = var.machine_user_parameters_key
}

resource "aws_iam_policy" "push_to_s3" {
  count       = var.allowed_s3_count
  name_prefix = "${var.name_prefix}-push-to-repos"
  description = "This policy allows push access to specific repos"
  policy      = data.aws_iam_policy_document.push_to_s3.json
}

resource "aws_iam_policy" "read_from_s3" {
  count       = var.allowed_read_s3_count
  name_prefix = "${var.name_prefix}-read-repos"
  description = "This policy allows read access to specific repos"
  policy      = data.aws_iam_policy_document.read_from_s3.json
}

resource "aws_iam_policy" "read_and_delete_from_s3" {
  count       = var.allowed_read_and_delete_s3_count
  name_prefix = "${var.name_prefix}-read-delete-repos"
  description = "This policy allows read and delete access to specific repos"
  policy      = data.aws_iam_policy_document.read_and_delete_from_s3.json
}

resource "aws_iam_user_policy_attachment" "kms-to-ext-machine-user" {
  count      = var.allowed_kms_count
  user       = aws_iam_user.ext_machine_user.name
  policy_arn = aws_iam_policy.encrypt_with_kms[0].arn
}

resource "aws_iam_user_policy_attachment" "decrypt-kms-to-ext-machine-user" {
  count      = var.allowed_decrypt_kms_count
  user       = aws_iam_user.ext_machine_user.name
  policy_arn = aws_iam_policy.decrypt_with_kms[0].arn
}

resource "aws_iam_policy" "encrypt_with_kms" {
  count       = var.allowed_kms_count
  name_prefix = "${var.name_prefix}-encrypt-with-kms"
  description = "This policy allows encrypt access to specific KMS keys"
  policy      = data.aws_iam_policy_document.encrypt_with_kms_key.json
}
data "aws_iam_policy_document" "encrypt_with_kms_key" {
  statement {
    effect = "Allow"

    actions = [
      "kms:GenerateDataKey"
    ]
    resources = concat(var.allowed_kms_arns, formatlist("%s/*", var.allowed_kms_arns))
  }
}


resource "aws_iam_policy" "decrypt_with_kms" {
  count       = var.allowed_decrypt_kms_count
  name_prefix = "${var.name_prefix}-decrypt-with-kms"
  description = "This policy allows en- and decrypt access to specific KMS keys"
  policy      = data.aws_iam_policy_document.decrypt_with_kms_key.json
}

data "aws_iam_policy_document" "decrypt_with_kms_key" {
  statement {
    effect = "Allow"
    actions = [
      "kms:Decrypt",
      "kms:GenerateDataKey"
    ]
    resources = concat(var.allowed_decrypt_kms_arns, formatlist("%s/*", var.allowed_decrypt_kms_arns))
  }
}

data "aws_iam_policy_document" "push_to_s3" {
  version = "2012-10-17"

  statement {
    effect = "Allow"
    actions = [
      "s3:PutObject",
      "s3:ListBucket"
    ]
    resources = concat(var.allowed_s3_arns, formatlist("%s/*", var.allowed_s3_arns))
  }
}

resource "aws_iam_user_policy_attachment" "s3-to-ext-machine-user" {
  count      = var.allowed_s3_count
  user       = aws_iam_user.ext_machine_user.name
  policy_arn = aws_iam_policy.push_to_s3[0].arn
}

data "aws_iam_policy_document" "read_from_s3" {
  version = "2012-10-17"

  statement {
    effect = "Allow"

    actions = [
      "s3:GetObject",
      "s3:GetObjectVersion",
      "s3:ListBucket",
      "s3:GetBucketLocation"
    ]

    resources = concat(var.allowed_read_s3_arns, formatlist("%s/*", var.allowed_read_s3_arns))
  }
}

resource "aws_iam_user_policy_attachment" "s3-read-to-ext-machine-user" {
  count      = var.allowed_read_s3_count
  user       = aws_iam_user.ext_machine_user.name
  policy_arn = aws_iam_policy.read_from_s3[0].arn
}

data "aws_iam_policy_document" "read_and_delete_from_s3" {
  version = "2012-10-17"

  statement {
    effect = "Allow"

    actions = [
      "s3:GetObject",
      "s3:GetObjectVersion",
      "s3:ListBucket",
      "s3:GetBucketLocation",
      "s3:DeleteObject",
    ]

    resources = concat(var.allowed_read_and_delete_s3_arns, formatlist("%s/*", var.allowed_read_and_delete_s3_arns))
  }
}

resource "aws_iam_user_policy_attachment" "s3-read-and-delete-to-ext-machine-user" {
  count      = var.allowed_read_and_delete_s3_count
  user       = aws_iam_user.ext_machine_user.name
  policy_arn = aws_iam_policy.read_and_delete_from_s3[0].arn
}

resource "aws_iam_policy" "push_to_sqs" {
  count       = var.allowed_sqs_count
  name_prefix = "${var.name_prefix}-push-to-sqs"
  description = "This policy allows push access to specific sqs"
  policy      = data.aws_iam_policy_document.push_to_sqs.json
}

data "aws_iam_policy_document" "push_to_sqs" {
  version = "2012-10-17"

  statement {
    effect = "Allow"
    actions = [
      "sqs:SendMessage",
    ]
    resources = concat(var.allowed_sqs_arns, formatlist("%s/*", var.allowed_sqs_arns))
  }
}

resource "aws_iam_user_policy_attachment" "sqs-to-ext-machine-user" {
  count      = var.allowed_sqs_count
  user       = aws_iam_user.ext_machine_user.name
  policy_arn = aws_iam_policy.push_to_sqs[0].arn
}

resource "aws_iam_policy" "pull_from_sqs" {
  count       = var.allowed_pull_sqs_count
  name_prefix = "${var.name_prefix}-pull-from-sqs"
  description = "This policy allows pull access to specific sqs"
  policy      = data.aws_iam_policy_document.pull_from_sqs.json
}

data "aws_iam_policy_document" "pull_from_sqs" {
  version = "2012-10-17"

  statement {
    effect = "Allow"
    actions = [
      "sqs:ReceiveMessage",
      "sqs:DeleteMessage",
      "sqs:GetQueueAttributes",
    ]
    resources = concat(var.allowed_pull_sqs_arns, formatlist("%s/*", var.allowed_pull_sqs_arns))
  }
}

resource "aws_iam_user_policy_attachment" "pull-sqs-to-ext-machine-user" {
  count      = var.allowed_pull_sqs_count
  user       = aws_iam_user.ext_machine_user.name
  policy_arn = aws_iam_policy.pull_from_sqs[0].arn
}



resource "aws_iam_policy" "temporary_queue_response_sqs" {
  count       = var.allowed_temporary_queue_response_sqs_count
  name_prefix = "${var.name_prefix}-temporary_queue_response_sqs"
  description = "This policy allows responding on temporary queues to requests"
  policy      = data.aws_iam_policy_document.temporary_queue_response_sqs.json
}



data "aws_iam_policy_document" "temporary_queue_response_sqs" {
  version = "2012-10-17"

  statement {
    effect = "Allow"
    actions = [
      "sqs:ReceiveMessage",
      "sqs:DeleteMessage",
      "sqs:ChangeMessageVisibility",
      "sqs:GetQueueUrl",
      "sqs:SendMessage"

    ]
    resources = concat(var.allowed_temporary_queue_response_sqs_arns, formatlist("%s/*", var.allowed_temporary_queue_response_sqs_arns))
  }
}

resource "aws_iam_user_policy_attachment" "push-sqs-to-ext-machine-user" {
  count      = var.allowed_temporary_queue_response_sqs_count
  user       = aws_iam_user.ext_machine_user.name
  policy_arn = aws_iam_policy.temporary_queue_response_sqs[0].arn
}

resource "aws_iam_policy" "temporary_queue_request_sqs" {
  count       = var.allowed_temporary_queue_request_sqs_count
  name_prefix = "${var.name_prefix}-temporary_queue_request_sqs"
  description = "This policy allows creating temporary queues "
  policy      = data.aws_iam_policy_document.temporary_queue_request_sqs.json
}



data "aws_iam_policy_document" "temporary_queue_request_sqs" {
  version = "2012-10-17"

  statement {
    effect = "Allow"
    actions = ["sqs:ListQueues"]
    resources = ["*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "sqs:GetQueueAttributes",
      "sqs:GetQueueUrl",
      "sqs:ListDeadLetterSourceQueues",
      "sqs:ListQueues",
      "sqs:ListQueueTags",
      "sqs:ReceiveMessage",
      "sqs:TagQueue",
      "sqs:UntagQueue",
      "sqs:ChangeMessageVisibility",
      "sqs:ChangeMessageVisibilityBatch",
      "sqs:CreateQueue",
      "sqs:DeleteMessage",
      "sqs:DeleteMessageBatch",
      "sqs:DeleteQueue",
      "sqs:PurgeQueue",
      "sqs:SendMessage",
      "sqs:SendMessageBatch",
      "sqs:SetQueueAttributes"
    ]
    resources = concat(var.allowed_temporary_queue_request_sqs_arns, formatlist("%s/*", var.allowed_temporary_queue_request_sqs_arns))
  }
}

resource "aws_iam_user_policy_attachment" "create-temporary-queues-sqs-to-ext-machine-user" {
  count      = var.allowed_temporary_queue_request_sqs_count
  user       = aws_iam_user.ext_machine_user.name
  policy_arn = aws_iam_policy.temporary_queue_request_sqs[0].arn
}

# -----------------
# Create policy for user to be able to read application SSM parameters from AWS.
# Config is stored in System Manager under Parameter store with path /config.
data "aws_iam_policy_document" "read_ssm_application_config" {
  statement {
    effect = "Allow"

    actions = [
      "ssm:GetParameters",
      "ssm:GetParameter",
      "ssm:GetParameterHistory",
      "ssm:GetParametersByPath"
    ]

    resources = var.allowed_ssm_arns
  }
}

# create SSM policy
resource "aws_iam_policy" "read_ssm_application_config" {
  count       = length(var.allowed_ssm_arns) > 0 ? 1 : 0
  name_prefix = "${var.name_prefix}-read_ssm_application_config"
  description = "This policy allows read access to specific SSM paths"
  policy      = data.aws_iam_policy_document.read_ssm_application_config.json
}

# Attach policy to ext user.
resource "aws_iam_user_policy_attachment" "read_ssm_config_to_ext_machine_user" {
  count      = length(var.allowed_ssm_arns) > 0 ? 1 : 0
  user       = aws_iam_user.ext_machine_user.name
  policy_arn = aws_iam_policy.read_ssm_application_config[0].arn
}

# -----------------
# Create policy for user to be able to push cloudwatch metric data to AWS.
data "aws_iam_policy_document" "push_metric_data" {
  count = var.cloudwatch_metrics_access ? 1 : 0

  statement {
    effect = "Allow"

    actions = [
      "cloudwatch:PutMetricData",
    ]
      
    resources = [ 
      "*"
    ]
  }
}

resource "aws_iam_policy" "push_metric_data_config" {
  count       = var.cloudwatch_metrics_access ? 1 : 0
  name_prefix = "${var.name_prefix}-push_metric_data"
  description = "This policy allows read access to specific SSM paths"
  policy      = data.aws_iam_policy_document.push_metric_data[0].json
}

# Attach policy to ext user.
resource "aws_iam_user_policy_attachment" "push_metric_data_config_to_ext_machine_user" {
  count      = var.cloudwatch_metrics_access ? 1 : 0
  user       = aws_iam_user.ext_machine_user.name
  policy_arn = aws_iam_policy.push_metric_data_config[0].arn
}