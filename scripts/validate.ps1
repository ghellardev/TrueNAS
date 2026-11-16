$ErrorActionPreference = "Stop"

$TerraformPath = Join-Path $PSScriptRoot "..\terraform"

Push-Location $TerraformPath

try {
    terraform fmt -recursive
    if ($LASTEXITCODE -ne 0) { throw "Terraform formatting failed." }

    terraform init -backend=false
    if ($LASTEXITCODE -ne 0) { throw "Terraform initialization failed." }

    terraform validate
    if ($LASTEXITCODE -ne 0) { throw "Terraform validation failed." }

    Write-Host "Validation successful." -ForegroundColor Green
}
finally {
    Pop-Location
}