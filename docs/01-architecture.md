# 01 - Architecture

## Overview

This project uses Infrastructure as Code to manage a
TrueNAS SCALE environment.

## Architecture

Windows PC
    |
    | Terraform / Git
    |
    v
TrueNAS API
    |
    v
HP EliteDesk 800 G5

## Components

| Component | Responsibility |
|---|---|
| Windows PC | Configuration and administration |
| Terraform | Infrastructure management |
| Git | Version control |
| TrueNAS | Storage and application platform |
| TrueNAS API | Management interface |

## Design decisions

- Terraform configuration is maintained outside TrueNAS.
- Git tracks configuration and documentation.
- API credentials must be stored securely.
- Destructive operations require manual review.

## TODO

- [ ] Document network topology.
- [ ] Document API authentication.
- [ ] Document application architecture.