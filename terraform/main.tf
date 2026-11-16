# Main Terraform configuration.
# Resource definitions are maintained in separate files.

terraform {
  required_version = ">= 1.11.0"

  required_providers {
    truenas = {
      source  = "truenas/truenas"
      version = "~> 1.9"
    }
  }
}

# Initial connection and inventory phase.
# No infrastructure resources will be created or modified.