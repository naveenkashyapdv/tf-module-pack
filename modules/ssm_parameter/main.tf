resource "aws_ssm_parameter" "this" {
  name      = var.name
  type      = var.type
  value     = var.value
  overwrite = true
  tier      = var.tier
  tags      = var.tags


}
