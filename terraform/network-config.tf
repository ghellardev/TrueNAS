resource "truenas_network_config" "system" {
  hostname = "truenas"
  domain   = "local"

  ipv4gateway = ""
  ipv6gateway = ""

  nameserver1 = ""
  nameserver2 = ""
  nameserver3 = ""

  service_announcement = {
    netbios = true
    mdns    = false
    wsd     = true
  }
}