# 02 — Hardware Inventory

## Host

| Component | Details | Evidence/status |
|---|---|---|
| Manufacturer | HP | Repository documentation |
| Model | EliteDesk 800 G5 Tower | Repository documentation |
| Operating system | TrueNAS SCALE | Version not recorded |
| CPU | TODO | Not present in repository |
| RAM | TODO | Not present in repository |
| PSU | TODO | Not present in repository |

## Storage devices mentioned in Terraform

The table below records what the Terraform declarations and comments say. It is not a live hardware scan; confirm device identity, model, capacity, and pool membership in TrueNAS before relying on it.

| Declared role | Device identifier / model note | Declared interface or capacity | Configuration purpose |
|---|---|---|---|
| Bulk pool disk 1 | WD-BC0MJGPJ | Comment describes 10 TB HDD; interface not confirmed | Member of bulk mirror |
| Bulk pool disk 2 | WD-BC0MJRZJ | Comment describes 10 TB HDD; interface not confirmed | Member of bulk mirror |
| Cache device 1 | WD SN810 | Comment describes 1 TB NVMe | Part of manually configured striped L2ARC cache vdev |
| Cache device 2 | WD SN810 | Comment describes 1 TB NVMe | Part of manually configured striped L2ARC cache vdev |
| Apps pool disk | Samsung, identifier S425NX2KC97031 | Comment describes 256 GB NVMe | Single-disk apps stripe; no redundancy |
| OS SSD | TODO | Existing template says SATA; capacity/model unverified | Operating system |
| Additional SATA SSD | TODO | Model, capacity, and use unverified | TODO |

Confirm whether the device identifiers in Terraform are stable IDs accepted by the installed TrueNAS provider and match the intended physical drives.

## Expansion and system components

Not yet documented:

- Exact CPU and memory configuration.
- PSU model and capacity.
- GPU, hardware acceleration, and PCIe slot allocation.
- SATA controllers, drive bays, and hot-swap equipment.
- Power, cooling, and UPS model/runtime.
- Serial numbers and SMART health for all drives.

## TODO

- [ ] Record CPU, RAM, PSU, and TrueNAS version from the host.
- [ ] Verify model, capacity, stable identifier, interface, and health for every drive.
- [ ] Record the boot device separately from data-pool devices.
- [ ] Verify whether both SN810 devices are installed and actually used as the documented L2ARC cache vdev.
- [ ] Document controller/PCIe layout, GPU, UPS, power, and cooling.
