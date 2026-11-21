# 01 — Architecture

## Purpose and status

This project documents and manages a self-hosted TrueNAS SCALE environment with Terraform. Repository configuration is the source for the declared design summarized here. It is not evidence that a setting has been applied or that a service is running on the live host.

## Management flow

Windows workstation
    |
    | Git, Terraform CLI, provider API requests
    v
TrueNAS API
    |
    v
HP EliteDesk 800 G5 Tower
    |
    +-- ZFS storage
    +-- TrueNAS applications / custom Compose deployments
         +-- Immich
         +-- Home Assistant

GitHub stores the configuration and documentation and runs static Terraform checks. The CI job does not connect to the NAS.

## Components and responsibilities

| Component | Responsibility | Status |
|---|---|---|
| Windows workstation | Terraform execution and administration | Identified; workstation details TODO |
| Terraform | Reads inventory and declares selected host resources | Configured in repository; state/live alignment unverified |
| TrueNAS provider/API | Communicates with the host | Provider configured; live connectivity not rechecked here |
| GitHub | Version control and static checks | Workflow present |
| TrueNAS SCALE | Storage and application platform | Host model documented; live version TODO |
| Immich | Photo and video management | Custom application declared |
| Home Assistant | Home automation | Custom application declared |

## Terraform behavior

The Terraform directory contains both read-only data sources and managed resources. Inventory data sources read system, network, Docker, service, pool, dataset, share, interface, and snapshot information. Resource declarations cover selected service settings, network/Docker settings, storage, and custom applications.

The current files are therefore not read-only as a whole. A Terraform plan may propose changes. Existing resources must be inventoried and imported before Terraform takes ownership. Review every plan before any apply.

## Declared application and storage layout

- The bulk pool is declared as a two-disk HDD mirror.
- The apps pool is declared as a single-disk stripe with no redundancy.
- Immich and Home Assistant are declared as custom applications with persistent datasets.
- Two NVMe devices are described in comments as a manually configured striped L2ARC cache vdev because of a provider limitation.

These are repository declarations and comments. Verify each item on the live system; see [hardware](02-hardware.md), [storage](04-storage-design.md), and [applications](05-applications.md).

## Inventory outputs

Terraform outputs currently expose the configured hostname, DNS servers, Docker storage pool and dataset, NVIDIA setting, timezone, system dataset, SSH/SMB/NFS configuration, and selected service status. These values are produced from a mixture of read-only data sources and managed resource attributes. Check the relevant output and its source before treating it as observed live state.

## Outstanding architecture facts

- TrueNAS SCALE version and current host configuration.
- API authentication method, account privileges, and endpoint.
- Network topology, VLANs, firewall, and remote-access path.
- Terraform backend/state location, ownership, and import coverage.
- Actual service and application status.

See [security](06-security.md) and [operations](07-operations.md) for credential, state, and recovery concerns.
