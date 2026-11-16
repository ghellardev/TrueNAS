# Main Terraform configuration.
# Resource definitions are maintained in separate files.

terraform {
  required_providers {
    truenas = {
      source = "truenas/truenas"
    }
  }
}