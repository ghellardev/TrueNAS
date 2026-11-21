# 06 — Security

## Credential handling

The provider endpoint and API key are Terraform input variables marked sensitive and are not given committed values. Supply credentials through an approved secure local or CI mechanism; never store them in tracked files, command history, or shared logs.

The Immich database password is a required sensitive variable and is passed through the provider's write-only Compose configuration field. Do not place its value in documentation. Protect Terraform state and any state backups because sensitive markers do not encrypt state or guarantee that every value is absent from it.

The UPS monitor password variable is marked sensitive but currently has a committed, non-empty default. Replace that default with a securely supplied value before using the configuration. If the default has ever been used on a host, rotate the credential.

## TLS

The Terraform variable controlling insecure TLS behavior defaults to true, which disables certificate verification in the provider configuration. Set this deliberately and prefer certificate verification with a trusted certificate before connecting to the live host.

## Access control and network exposure

The documentation recommends a dedicated automation account and least-privilege API access, but does not record a live account, role, firewall policy, management network, certificate, or remote-access design. Verify and document these controls without publishing credentials or private network details that should remain restricted.

## Terraform and repository safety

- Never commit API keys, passwords, private SSH keys, Terraform state, or sensitive configuration.
- Keep state outside Git and restrict access to it and its backups.
- Review every plan before apply. A plan may change service, network, storage, or application settings.
- Import existing resources before managing them.
- Pool/dataset prevent_destroy safeguards reduce some accidental deletion paths but are not a substitute for backups and review.

## Current follow-up

- [ ] Remove the committed UPS password default and securely provide the value.
- [ ] Set and verify TLS certificate validation.
- [ ] Confirm a dedicated least-privilege API account and rotate any exposed credentials.
- [ ] Document account permissions, network restrictions, firewall rules, certificates, and remote-access policy.
- [ ] Confirm state storage, access control, encryption, and backup protection.

See [operations](07-operations.md) for current state backup behavior.
