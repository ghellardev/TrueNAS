# TrueNAS Infrastructure

Infrastructure as Code project for managing and documenting
a self-hosted TrueNAS SCALE environment.

## Environment

| Component | Description |
|---|---|
| Host | HP EliteDesk 800 G5 Tower |
| OS | TrueNAS SCALE |
| Management OS | Windows |
| IaC | Terraform |
| Version control | Git |
| Main application | Immich |
| Storage | HDD / SATA SSD / NVMe |

## Project objectives

- Document hardware and infrastructure.
- Manage supported TrueNAS resources through Terraform.
- Maintain infrastructure configuration in Git.
- Track changes and document decisions.
- Establish repeatable configuration and recovery procedures.

## Repository structure

- `docs/` - Infrastructure documentation.
- `terraform/` - Terraform configuration.
- `scripts/` - PowerShell helper scripts.
- `.github/` - GitHub automation.

## Getting started

1. Read the documentation in `docs/`.
2. Review the Terraform provider configuration.
3. Configure API credentials securely.
4. Run `terraform init`.
5. Run `terraform validate`.
6. Review `terraform plan` before applying changes.

## Important

Existing infrastructure must be documented and imported
before Terraform is allowed to manage it.

Never commit API keys, Terraform state files or other secrets.

## Project Status

Active development.

### Completed
- [x] Project structure established.
- [x] GitHub repository configured.
- [x] Terraform provider installed.
- [x] TrueNAS API connectivity verified.
- [x] Initial read-only inventory implemented.

### Planned
- [ ] Complete hardware inventory.
- [ ] Document ZFS pools and datasets.
- [ ] Document applications and networking.
- [ ] Import existing resources where appropriate.
- [ ] Expand infrastructure management.