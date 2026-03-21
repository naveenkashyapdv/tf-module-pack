<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ssm_parameter.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_tier"></a> [tier](#input\_tier) | n/a | `string` | `"Standard"` | no |
| <a name="input_type"></a> [type](#input\_type) | n/a | `string` | `"SecureString"` | no |
| <a name="input_value"></a> [value](#input\_value) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_parameter_arn"></a> [parameter\_arn](#output\_parameter\_arn) | n/a |
| <a name="output_parameter_name"></a> [parameter\_name](#output\_parameter\_name) | n/a |
<!-- END_TF_DOCS -->