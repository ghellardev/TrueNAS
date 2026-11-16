param(
    [string]$BackupPath = "$env:USERPROFILE\TrueNAS-Terraform-Backups"
)

$ErrorActionPreference = "Stop"

$TerraformPath = Join-Path $PSScriptRoot "..\terraform"
$StateFile = Join-Path $TerraformPath "terraform.tfstate"

if (-not (Test-Path $StateFile)) {
    Write-Host "No local Terraform state found." -ForegroundColor Yellow
    exit 0
}

New-Item -ItemType Directory -Path $BackupPath -Force | Out-Null

$Timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$Destination = Join-Path $BackupPath "terraform-$Timestamp.tfstate"

Copy-Item $StateFile $Destination

Write-Host "State backup created: $Destination" -ForegroundColor Green
Write-Warning "State may contain secrets. Protect this backup with encryption."