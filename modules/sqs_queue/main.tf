resource "aws_sqs_queue" "this" {
  name                       = var.name
  delay_seconds              = var.delay_seconds
  visibility_timeout_seconds = var.visibility_timeout_seconds
  message_retention_seconds  = var.message_retention_seconds
  kms_master_key_id          = var.kms_master_key_id
  tags                       = var.tags
}
