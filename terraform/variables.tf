# Declare Terraform input variables here.


variable "truenas_endpoint" {
  description = "TrueNAS API WebSocket endpoint"
  type        = string
  sensitive   = true
}

variable "truenas_api_key" {
  description = "TrueNAS API key"
  type        = string
  sensitive   = true
}

variable "truenas_insecure" {
  description = "Whether to skip TLS certificate validation"
  type        = bool
  default     = true
}

variable "truenas_hostname" {
  description = "Hostname of the TrueNAS server"
  type        = string
  default     = "truenas"
}

variable "ups_monitor_password" {
  description = "NUT monitor password"
  type        = string
  sensitive   = true
  default     = "tesTPassw0rd"
}

variable "immich_db_password" {
  description = "Immich PostgreSQL password"
  type        = string
  sensitive   = true
}