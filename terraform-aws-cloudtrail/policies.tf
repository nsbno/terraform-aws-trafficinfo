data "aws_iam_policy_document" "cloudtrail_s3" {
  statement {
   
            principals {
              type        = "Service"
              identifiers = ["cloudtrail.amazonaws.com"]
            }
            actions = ["s3:GetBucketAcl",]
            resources = ["arn:aws:s3:::${var.name_prefix}-cloudtrail-logs-${var.env}"]
        }
  statement {

            principals {
              type        = "Service"
              identifiers = ["cloudtrail.amazonaws.com"]
            }
            actions = ["s3:PutObject",]
            resources = ["arn:aws:s3:::${var.name_prefix}-cloudtrail-logs-${var.env}/${var.name_prefix}/AWSLogs/${local.current_account_id}*",]
            condition {
                test     = "StringEquals"
                variable = "s3:x-amz-acl" 
                values   = ["bucket-owner-full-control"]
                
            }
        }
}