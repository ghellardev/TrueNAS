# 04 - Storage Design

## Storage overview

The system uses a combination of:

- HDDs for bulk storage.
- SATA SSDs for additional storage.
- NVMe for high-performance workloads.

## ZFS pools

| Pool | Devices | RAID level | Purpose |
|---|---|---|---|
| TODO | TODO | TODO | TODO |

## Datasets

| Dataset | Pool | Purpose | Quota |
|---|---|---|---|
| TODO | TODO | TODO | TODO |

## Storage policies

Document:

- Pool topology.
- Dataset hierarchy.
- Compression.
- Record sizes.
- Quotas and reservations.
- Snapshot policies.
- Replication.
- SMART monitoring.

## Important

Do not assume that SSDs automatically accelerate HDD pools.
Document special vdevs, L2ARC and SLOG separately.

## TODO

- [ ] Inventory existing pools.
- [ ] Document dataset hierarchy.
- [ ] Document snapshot schedules.
- [ ] Document backup strategy.