# TrueNAS Infrastructure

Infrastructure as Code project for documenting and managing a self-hosted TrueNAS SCALE environment.

## Environment

| Component | Declared details |
|---|---|
| Host | HP EliteDesk 800 G5 Tower |
| Operating system | TrueNAS SCALE |
| Management workstation | Windows |
| Infrastructure as code | Terraform with the TrueNAS provider |
| Version control and automation | GitHub |
| Applications defined in Terraform | Immich and Home Assistant |
| Storage | HDD, SATA SSD, and NVMe are mentioned in the project; exact inventory is incomplete |

Hardware and configuration details below are derived from repository files. They describe intended Terraform configuration, not independently verified live TrueNAS state. See the [documentation index](docs/01-architecture.md) and the [hardware](docs/02-hardware.md), [networking](docs/03-networking.md), [storage](docs/04-storage-design.md), [applications](docs/05-applications.md), [security](docs/06-security.md), and [operations](docs/07-operations.md) guides.

## Project objectives

- Document the host, storage, network, applications, and operating procedures.
- Inventory TrueNAS resources through Terraform data sources.
- Manage supported TrueNAS resources only after verifying the live system and importing existing resources where appropriate.
- Keep configuration and decisions in Git while protecting credentials and Terraform state.
- Establish repeatable validation, backup, and recovery procedures.

## Repository structure

- docs/ — infrastructure and operations documentation.
- terraform/ — provider, inventory, outputs, and managed resource declarations.
- scripts/ — PowerShell validation and local Terraform state backup helpers.
- .github/ — GitHub Actions workflow for Terraform checks.

## Current project status

The repository has advanced beyond a read-only inventory scaffold. Terraform includes read-only data sources and outputs, as well as resource declarations that can change pools, datasets, services, network and Docker configuration, and applications. The presence of a declaration does not confirm that the resource exists, has been imported, or is currently running on the host.

### Present in the repository

- TrueNAS provider configuration and locked provider dependencies.
- Inventory queries for system, network, Docker, service, and service-configuration information.
- Terraform declarations for the bulk and applications pools, application datasets, services, Immich, and Home Assistant.
- PowerShell validation and local state backup scripts.
- GitHub Actions formatting, initialization, and validation checks for Terraform changes.

### Still to confirm or complete

- Compare Terraform state and plans with the actual TrueNAS host; confirm which existing resources are imported.
- Complete the physical hardware and live network inventory.
- Verify pools, datasets, cache devices, services, and applications on the host.
- Document snapshots, replication, application backups, and tested recovery procedures.
- Review and replace unsafe or unverified credential and TLS defaults before using Terraform against the host.

## Safe starting workflow

1. Read the guides in docs/ and review the Terraform declarations.
2. Configure the endpoint and credentials using a secure local method; do not commit them.
3. Run Terraform initialization, formatting checks, and validation.
4. Capture the live inventory and reconcile it with Terraform state. Import existing resources before managing them.
5. Review the complete plan and confirm every proposed change against the host.
6. Apply only after the plan is understood and the state and recovery arrangements are suitable.

See [Terraform workflow and safeguards](terraform/README.md) and [operations](docs/07-operations.md).

## Security

Never commit API keys, passwords, private keys, Terraform state, or other sensitive files. Terraform's sensitive marker does not encrypt state. The current configuration also has TLS verification and credential defaults that need review before use; see [security](docs/06-security.md).

## Checks

The GitHub Actions workflow runs Terraform formatting checks, backend-free initialization, and validation for Terraform changes. These checks do not connect to the TrueNAS server or prove that an apply is safe.
