data "aws_region" "current" {}
data "aws_caller_identity" "current" {}
locals {
  current_account_id = data.aws_caller_identity.current.account_id
  current_region     = data.aws_region.current.name
}

resource "aws_cloudtrail" "cloudtrail" {
  name                          = "${var.name_prefix}-trail"
  s3_bucket_name                = aws_s3_bucket.cloudtrail_logs.id
  s3_key_prefix                 = var.name_prefix
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_log_file_validation    = true
  tags = var.tags
}

resource "aws_s3_bucket" "cloudtrail_logs" {
  bucket        = "${var.name_prefix}-cloudtrail-logs-${var.env}"
  force_destroy = true
  policy        = data.aws_iam_policy_document.cloudtrail_s3.json
}