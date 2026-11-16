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
