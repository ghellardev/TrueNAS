
# ============================================================
# Home Assistant storage
# ============================================================

resource "truenas_dataset" "home_assistant" {
  name          = "apps/home-assistant"
  share_type    = "APPS"
  compression   = "LZ4"
  force_destroy = false

  lifecycle {
    prevent_destroy = true
  }
}

# ============================================================
# Home Assistant application
# ============================================================

resource "truenas_app" "home_assistant" {
  name       = "home-assistant"
  custom_app = true
  running    = true

  depends_on = [
    truenas_dataset.home_assistant
  ]

  custom_compose_config_string = <<-YAML
    name: home-assistant

    services:
      home-assistant:
        container_name: home_assistant
        image: ghcr.io/home-assistant/home-assistant:2026.11.2

        network_mode: host

        volumes:
          - /mnt/apps/home-assistant:/config
          - /etc/localtime:/etc/localtime:ro

        devices:
          - /dev/serial/by-id/usb-Itead_Sonoff_Zigbee_3.0_USB_Dongle_Plus_V2_6e7c45e99712ef11987a6db8bf9df066-if00-port0:/dev/ttyUSB0

        environment:
          TZ: Europe/Bucharest

        restart: unless-stopped
  YAML
}
