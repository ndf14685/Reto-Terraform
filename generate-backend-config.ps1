$accessKey = $env:DIG_OC_ACCESSKEY
$secretKey = $env:DIG_OC_SECRETKEY

if (!$accessKey -or !$secretKey) {
    Write-Host "Error: Missing access key or secret key environment variables." -ForegroundColor Red
    exit 1
}

$backendConfig = @"
backend_access_key = "$accessKey"
backend_secret_key = "$secretKey"
"@

Set-Content -Path "backend.auto.tfvars" -Value $backendConfig

Write-Host "backend.auto.tfvars generated successfully." -ForegroundColor Green
