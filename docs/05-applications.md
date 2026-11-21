# 05 — Applications

## Application inventory

| Application | Purpose | Deployment declaration | Persistent storage |
|---|---|---|---|
| Immich | Photo and video management | Custom Compose application; server, machine-learning, Valkey, and PostgreSQL services | apps/immich-postgres, apps/immich-redis, apps/immich-machine-learning, bulk/immich-library |
| Home Assistant | Home automation | Custom Compose application; host network mode | apps/home-assistant |

Terraform declarations do not confirm that either application is deployed or healthy on the live host.

## Immich

The Terraform Compose configuration declares:

- Immich server and machine-learning images from ghcr.io at v3, pinned by image digest.
- Valkey 9, also pinned by image digest, for the Redis-compatible service.
- Immich PostgreSQL image based on PostgreSQL 14 with the VectorChord and pgvectors extensions, pinned by digest.
- Server media mount at /mnt/bulk/immich-library, mapped to /data in the container.
- PostgreSQL, Valkey, and machine-learning cache mounts under /mnt/apps.
- Server port mapping 2283:2283.
- Europe/Bucharest timezone.
- Health checks for Valkey and service dependencies so the server waits for healthy database/cache services.
- An Immich database password supplied through the provider's separate write-only Compose configuration field. The value is not documented here.

Verify current upstream image versions and the digest-to-version mapping when planning upgrades. Confirm that the dataset paths exist and are mounted as intended. GPU acceleration is not configured in the shown Immich Compose definition.

## Home Assistant

The Terraform Compose configuration declares:

- Image ghcr.io/home-assistant/home-assistant:2026.11.2.
- Host networking.
- Persistent configuration at /mnt/apps/home-assistant mapped to /config.
- Host localtime mounted read-only and timezone set to Europe/Bucharest.
- A Sonoff Zigbee 3.0 USB Dongle Plus V2 device path mapped to /dev/ttyUSB0.
- Restart policy unless-stopped.

The image tag, USB device path, host-network access, and physical dongle availability need verification on the host. No explicit port mapping is declared in Compose.

## Application operations still to document

- [ ] Confirm live deployment, version, status, ports, and health for each application.
- [ ] Document Immich library/import/upload paths, user access, and GPU decision.
- [ ] Document Home Assistant integrations, Zigbee configuration, and recovery needs.
- [ ] Define and test application-consistent backups and restores for databases, media, and configuration.
- [ ] Document upgrade and rollback procedures.
