# ZFS pools and datasets.
#
# Inventory and import existing resources before
# creating or modifying storage infrastructure.


# Main storage pool: 2 x 10 TB HDDs in a ZFS mirror.
# Both 1 TB SN810 drives are attached as L2ARC cache devices.

resource "truenas_pool" "bulk" {
  name = "bulk"

  topology = {
    data = [
      {
        type = "MIRROR"
        disks = [
          "WD-BC0MJGPJ",
          "WD-BC0MJRZJ"
        ]
      }
    ]
  }

  force_destroy = false

  lifecycle {
    prevent_destroy = true
  }
}

# Applications pool: single 256 GB Samsung NVMe.
# No redundancy.

resource "truenas_pool" "apps" {
  name = "apps"

  topology = {
    data = [
      {
        type = "STRIPE"

        disks = [
          "S425NX2KC97031"
        ]
      }
    ]
  }

  force_destroy = false

  lifecycle {
    prevent_destroy = true
  }
}

# The TrueNAS Terraform provider v1.9.2 exposes cache devices as a flat list
# and cannot correctly represent multiple disks grouped into a single striped
# cache vdev. Attempting to configure both SSDs here causes TrueNAS to reject
# the pool creation with an "Only one row for the virtual device of type cache
# is allowed" error.
#
# Therefore, the bulk pool is created through Terraform with only its HDD
# mirror. The two WD SN810 NVMe SSDs are added afterwards through the TrueNAS
# web interface as a single striped L2ARC cache vdev.
#
# This is a provider limitation, not a limitation of ZFS or TrueNAS.