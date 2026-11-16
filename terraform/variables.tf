# Declare Terraform input variables here.
#
# Example:
#
# variable "truenas_endpoint" {
#   description = "TrueNAS API endpoint"
#   type        = string
# }

variable "truenas_api_key" {
  description = "Enter TrueNAS API key"
  type        = string
  sensitive   = true
}

