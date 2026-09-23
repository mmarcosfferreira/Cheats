# Test script para verificar problema de sintaxe
$testCode = @'
function Test-Func {
    param([string]$Method)
    
    if ($Method -eq 'A') {
        Write-Host "A"
    }
    elseif ($Method -eq 'B') {
        Write-Host "B"
    }
    
    Write-Host "Done"
}
'@

$errors = $null
$null = [System.Management.Automation.Language.Parser]::ParseScriptBlock($testCode, [ref]$null, [ref]$errors)
if ($errors) {
    $errors | ForEach-Object { Write-Host "ERROR: Line $($_.Extent.StartLineNumber): $($_.Message)" }
} else {
    Write-Host "OK - No syntax errors" -ForegroundColor Green
}