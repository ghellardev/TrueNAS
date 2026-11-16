# 07 - Operations

## Standard Terraform workflow

```powershell
terraform fmt -recursive
terraform validate
terraform plan
terraform apply
```

## Git workflow

```powershell
git status
git add .
git commit -m "Describe your changes"
git push
```

## Maintenance

Document:

- TrueNAS updates.
- Disk replacement.
- Pool expansion.
- Snapshot recovery.
- Application recovery.
- Configuration restoration.

## Recovery procedures

Document how to recover the Terraform configuration,
state and TrueNAS environment.

## TODO

- [ ] Test configuration backup.
- [ ] Document recovery procedures.
- [ ] Document disk replacement procedure.