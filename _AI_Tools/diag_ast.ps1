$file = "d:\Desenvolvimento\Power Sheel\ERP_GESTAO_REDUZIDA\ERP_GESTAO_REDUZIDA_EXTREME.PS1"
$content = Get-Content $file -Raw
$errors = $null
$ast = [Management.Automation.Language.Parser]::ParseInput($content, [ref]$null, [ref]$errors)

if ($errors) {
    Write-Host "Found $($errors.Count) errors:" -ForegroundColor Red
    foreach ($err in $errors) {
        Write-Host "Error: $($err.Message)" -ForegroundColor Red
        Write-Host "Line: $($err.Extent.StartLineNumber)"
        Write-Host "Column: $($err.Extent.StartColumnNumber)"
        $snippet = $err.Extent.Text
        if ($snippet.Length -gt 100) { $snippet = $snippet.Substring(0, 100) + "..." }
        Write-Host "At: $snippet"
        Write-Host "---"
    }
} else {
    Write-Host "No syntax errors found by AST parser." -ForegroundColor Green
}
