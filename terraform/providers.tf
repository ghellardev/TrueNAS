# Configure the TrueNAS provider here.
#
# Before proceeding:
# 1. Verify the provider's current schema.
# 2. Configure the TrueNAS WebSocket endpoint.
# 3. Configure authentication securely.
# 4. Verify TLS certificate validation.
#
# Do not hardcode API keys in this file.

provider "truenas" {
  endpoint = var.truenas_endpoint
  api_key  = var.truenas_api_key
  insecure = var.truenas_insecure
}
