# Terraform Configuration

This directory contains infrastructure definitions
for TrueNAS.

## Workflow

```powershell
terraform init
terraform fmt -recursive
terraform validate
terraform plan
terraform apply
```

## Rules

1. Inventory existing resources first.
2. Import existing resources before managing them.
3. Review every Terraform plan.
4. Never commit state files or secrets.
5. Test destructive changes carefully.

Provider documentation:

https://registry.terraform.io/providers/truenas/truenas/latest/docs