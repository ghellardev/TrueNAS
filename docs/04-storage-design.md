# 04 — Storage Design

## Declared ZFS pools

These definitions come from terraform/storage.tf and comments. Verify pool existence, state, device membership, and health on the TrueNAS host before importing or applying.

| Pool | Declared devices | Topology | Intended use | Important note |
|---|---|---|---|---|
| bulk | WD-BC0MJGPJ and WD-BC0MJRZJ | Two-disk mirror | Bulk data and Immich media library | Terraform declares pool resource; existing-pool import status unknown |
| apps | S425NX2KC97031 | Single-disk stripe | Application and database data | No redundancy; Terraform declares pool resource |

The configuration sets force_destroy to false and prevent_destroy on both pool resources. These safeguards do not replace verifying the live topology, state, and plan.

## Cache devices

Terraform comments describe two 1 TB WD SN810 NVMe drives as a striped L2ARC cache vdev added manually through the TrueNAS UI. The comments state that provider version 1.9.2 cannot correctly represent multiple disks grouped into a striped cache vdev. This is a documented manual step, not a Terraform-managed cache declaration. Confirm whether the step was performed and record the live cache topology.

L2ARC is cache, not pool redundancy or a backup. Do not confuse it with a special vdev or SLOG.

## Datasets declared for applications

| Dataset path | Application purpose | Share type | Compression | Destruction safeguard |
|---|---|---|---|---|
| apps/immich-postgres | Immich PostgreSQL data | APPS | LZ4 | prevent_destroy; force_destroy false |
| apps/immich-redis | Immich Valkey data | APPS | LZ4 | prevent_destroy; force_destroy false |
| apps/immich-machine-learning | Immich ML cache | APPS | LZ4 | prevent_destroy; force_destroy false |
| bulk/immich-library | Immich media library | APPS | LZ4 | prevent_destroy; force_destroy false |
| apps/home-assistant | Home Assistant configuration | APPS | LZ4 | prevent_destroy; force_destroy false |

The quota, reservation, record size, mount options, and actual dataset existence are not established by these declarations. Confirm mount paths and ownership on the host; see [applications](05-applications.md).

## Storage policies and gaps

The repository does not document actual snapshot schedules, replication targets, backup copies, retention, SMART alerting, scrub schedules, quotas, or restore tests. No backup strategy should be inferred from the pool or dataset declarations.

## TODO

- [ ] Inventory live pools, topology, disk IDs, health, and cache devices.
- [ ] Import existing pools and datasets before Terraform manages them.
- [ ] Record dataset hierarchy, quotas/reservations, record sizes, ownership, and mount paths.
- [ ] Document snapshots, replication, off-host backups, retention, scrubs, and SMART monitoring.
- [ ] Test and document recovery of the media library, databases, and application configuration.
