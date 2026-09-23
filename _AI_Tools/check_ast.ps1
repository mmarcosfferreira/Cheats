$filePath = 'd:\Desenvolvimento\Power Sheel\ERP_GESTAO_REDUZIDA\ERP_GESTAO_REDUZIDA_backup_extreme.ps1'
$content = Get-Content $filePath -Raw
$errors = $null
$ast = [System.Management.Automation.Language.Parser]::ParseInput($content, [ref]$null, [ref]$errors)

if ($errors) {
    Write-Host "ERROS DE PARSING ENCONTRADOS:" -ForegroundColor Red
    foreach ($err in $errors) {
        Write-Host "Linha $($err.Extent.StartLineNumber), Coluna $($err.Extent.StartColumnNumber): $($err.Message)" -ForegroundColor Yellow
    }
} else {
    Write-Host "O SCRIPT ESTÁ SINTATICAMENTE CORRETO (AST)." -ForegroundColor Green
}
