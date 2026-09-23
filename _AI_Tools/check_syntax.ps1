$errors = $null
$null = [System.Management.Automation.Language.Parser]::ParseFile(
    "D:\Desenvolvimento\Power Sheel\ERP_GESTAO_REDUZIDA\ERP_GESTAO_REDUZIDA_EXTREME.PS1",
    [ref]$null,
    [ref]$errors
)
if ($errors) {
    $errors | ForEach-Object {
        Write-Host "Line $($_.Extent.StartLineNumber): $($_.Message)" -ForegroundColor Red
    }
} else {
    Write-Host "No syntax errors found!" -ForegroundColor Green
}