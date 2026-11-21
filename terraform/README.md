# Terraform Configuration

This directory contains the TrueNAS provider configuration, inventory data sources, outputs, and managed resource declarations. The repository currently mixes read-only inventory with resources that can modify the host; review resource blocks and data blocks separately.

## Workflow

~~~powershell
terraform init
terraform fmt -recursive
terraform validate
terraform plan
~~~

Run these commands from this directory, or use the repository's PowerShell helper script. The GitHub Actions workflow checks formatting, initializes without a backend, and validates; it does not connect to TrueNAS.

## Before managing the host

1. Verify the endpoint, API permissions, TLS settings, provider version, and credential source.
2. Capture the live host inventory and compare pools, datasets, services, network settings, Docker configuration, and applications with these declarations.
3. Confirm which resources already exist and import them into the intended Terraform state before managing them.
4. Inspect the full plan. Do not apply a plan that proposes recreating existing storage or changing unverified host settings.
5. Protect state and state backups as sensitive data.

Pool and dataset declarations use prevent-destroy lifecycle rules, but those rules do not make an unreviewed plan safe and do not replace verified imports and backups.

## Versions and provider

The root module requires Terraform CLI 1.11.0 or newer. The required provider is truenas/truenas with a ~> 1.9 version constraint; the lock file records the selected provider package. See the [provider documentation](https://registry.terraform.io/providers/truenas/truenas/latest/docs).

## Configuration notes

- Endpoint and API key are input variables marked sensitive. Supply them outside version control.
- TLS certificate verification is currently configured through a variable whose default disables verification. Review and set it deliberately.
- Terraform contains two network configuration resource declarations. Reconcile their intended ownership and values before applying.
- The UPS monitor password variable has a committed non-empty default. Replace this with a securely supplied value before use.
- The Immich database password is required and marked sensitive; handle Terraform state as if it may contain secrets.
