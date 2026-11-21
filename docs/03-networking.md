# 03 — Networking

## Known and declared settings

| Parameter | Repository value | Status |
|---|---|---|
| TrueNAS IP / subnet | TODO | Not recorded |
| Gateway and DNS servers | Empty values in one Terraform network resource | Verify live values and reconcile before apply |
| Hostname | Default value is truenas in Terraform | Declared, not live-verified |
| Domain | local in terraform/network-config.tf | Declared, not live-verified |
| Service announcements | NetBIOS enabled, mDNS disabled, WSD enabled in terraform/network-config.tf | Declared, not live-verified |
| Interface, VLANs, routes | TODO | Not recorded |
| API endpoint | Input variable, value intentionally not committed | Configure securely; live endpoint not recorded |

There are two Terraform resource declarations for TrueNAS network configuration: one in terraform/network-config.tf and one in terraform/system.tf. Their ownership and complete desired settings need to be reconciled before applying. In particular, do not infer that blank gateway or DNS values represent the live host configuration.

## Declared application networking

| Service | Terraform declaration | Port / mode |
|---|---|---|
| TrueNAS management | Existing guide lists HTTPS | 443; live certificate and access policy TODO |
| SSH | Existing guide lists SSH | 22; Terraform declares the service disabled |
| SMB | Existing guide lists SMB | 445; Terraform declares the service enabled and running |
| Immich | Port mapping in custom Compose configuration | 2283 |
| Home Assistant | Host networking | No explicit port mapping in Compose; verify effective access on host |

Ports listed above describe the repository or the existing guide, not firewall exposure. Confirm listeners and rules on the live network.

## Network services declared in Terraform

The Terraform service resources declare SMB (TrueNAS service name cifs) enabled/running and UPS enabled/running. NFS, iSCSI, NVMe-oF, SSH, FTP, and SNMP are declared disabled/not running. These are desired values in resource blocks, not an observation of current runtime state.

## TODO

- [ ] Record host IP, subnet, gateway, DNS, interface, VLANs, and routing.
- [ ] Reconcile the two network configuration resources and verify the intended values.
- [ ] Document firewall rules, management-network restrictions, remote access, and DNS records.
- [ ] Verify application access paths, effective ports, and host-network exposure.
- [ ] Record HTTPS certificate configuration and confirm TLS validation behavior.

See [applications](05-applications.md) and [security](06-security.md).
