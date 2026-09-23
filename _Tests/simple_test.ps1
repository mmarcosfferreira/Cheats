# Simples teste de parsing
$file = "D:\Desenvolvimento\Power Sheel\ERP_GESTAO_REDUZIDA\ERP_GESTAO_REDUZIDA_EXTREME.PS1"

$errors = $null
try {
    $script = [System.Management.Automation.Language.Parser]::ParseFile($file, [ref]$null, [ref]$errors)
    if ($errors) {
        Write-Host "Syntax errors found:" -ForegroundColor Red
        $errors | ForEach-Object {
            Write-Host "Line $($_.Extent.StartLineNumber): $($_.Message)" -ForegroundColor Yellow
        }
    } else {
        Write-Host "No syntax errors!" -ForegroundColor Green
    }
} catch {
    Write-Host "Parse error: $_" -ForegroundColor Red
}