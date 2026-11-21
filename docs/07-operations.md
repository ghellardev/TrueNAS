# 07 — Operations

## Terraform workflow

From the terraform directory:

~~~powershell
terraform init
terraform fmt -recursive
terraform validate
terraform plan
~~~

Review the live inventory and Terraform state before any apply. Import existing resources before managing them, then inspect the full plan and resolve unexpected create, replace, destroy, or configuration changes. Apply only when the plan is understood and recovery arrangements are ready. See the [Terraform safeguards](../terraform/README.md).

The repository's scripts/validate.ps1 runs Terraform formatting, backend-free initialization, and validation. Its formatting step may rewrite Terraform files. GitHub Actions runs terraform fmt -check -recursive, terraform init -backend=false, and terraform validate for changes under terraform/. CI does not authenticate to or test the TrueNAS host.

## State backup helper

scripts/backup-state.ps1 copies a local terraform/terraform.tfstate file, if present, to a timestamped file under the user's profile by default. It warns that state may contain secrets and advises encryption.

This helper is not an encrypted, off-host, application-consistent, or tested recovery system. It does not establish that the active Terraform state is local or that the copied file is current. State files and copies must be protected as sensitive data.

## Git workflow

~~~powershell
git status
git add .
git commit -m "Describe your changes"
git push
~~~

Do not stage local credential files or Terraform state.

## Maintenance and recovery procedures still needed

- [ ] Define and test TrueNAS configuration backup and restore.
- [ ] Define encrypted, off-host Terraform state backup, retention, and restore.
- [ ] Document ZFS snapshots, replication, restore, and disaster recovery.
- [ ] Document disk fault, replacement, resilver, pool expansion, and scrub procedures.
- [ ] Document Immich database/media and Home Assistant configuration backup and restore.
- [ ] Document TrueNAS and application upgrades, rollback, and maintenance windows.
- [ ] Record recovery dependencies, access requirements, and recovery test results.

## Live operational inventory still needed

Record actual TrueNAS version, pool/dataset state, service state, application health, backup freshness, and last successful recovery test. Repository declarations are not a substitute for this inventory.
