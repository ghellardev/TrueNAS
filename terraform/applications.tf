# Applications and related configuration.
# Start with Immich.

resource "truenas_docker_config" "config" {
  pool = truenas_pool.apps.name

  enable_image_updates = true
  nvidia               = false

  address_pools = [
    {
      base = "172.17.0.0/12"
      size = 24
    },
    {
      base = "fdd0::/48"
      size = 64
    }
  ]

  cidr_v6          = "fdd0::/64"
  registry_mirrors = []
}