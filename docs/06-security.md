# 06 - Security

## Authentication

- Use dedicated service accounts for automation.
- Use API keys instead of interactive passwords.
- Apply least-privilege permissions where supported.

## Secrets

Never commit:

- API keys.
- Passwords.
- Private SSH keys.
- Terraform state.
- Sensitive configuration files.

## Network security

Document:

- Management network restrictions.
- Firewall rules.
- HTTPS certificates.
- Remote access.
- SSH access policies.

## Terraform state

Terraform state may contain sensitive information.

Keep it outside the Git repository and protect backups
with encryption and restricted access.

## TODO

- [ ] Create dedicated Terraform account.
- [ ] Generate API key.
- [ ] Configure secure state backups.
- [ ] Review network exposure.