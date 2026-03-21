# Terraform Module Pack

This package is a reusable Terraform module starter kit for common AWS resources.

Included modules:
- `vpc`
- `security_group`
- `iam_role`
- `s3_bucket`
- `ec2_instance`
- `rds_instance`

## Notes
- This is a best-effort starter pack because the exact resource inventory was not provided.
- Module inputs are intentionally generic and safe to extend.
- Each module contains `main.tf`, `variables.tf`, and `outputs.tf`.
- The `examples/full_stack` folder shows how the modules can be wired together.

## Usage
```bash
terraform init
terraform plan
terraform apply
```

Start from `examples/full_stack` or copy the modules into your existing repo.
