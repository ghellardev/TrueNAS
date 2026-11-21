
# General TrueNAS system configuration

resource "truenas_system_general" "config" {
  timezone = "Europe/Bucharest"
}

resource "truenas_network_config" "config" {
  hostname = var.truenas_hostname
}