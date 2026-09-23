# Teste em blocos menores para encontrar o erro
$file = "D:\Desenvolvimento\Power Sheel\ERP_GESTAO_REDUZIDA\ERP_GESTAO_REDUZIDA_EXTREME.PS1"
$lines = Get-Content $file

# Testar de 950 a 1050 (região problemática)
for ($i = 950; $i -lt 1050; $i += 50) {
    $end = [Math]::Min($i + 49, $lines.Count - 1)
    $testContent = $lines[$i..$end] -join "`n"
    
    $errors = $null
    try {
        $null = [System.Management.Automation.Language.Parser]::ParseScriptBlock(
            [scriptblock]::Create($testContent),
            $null,
            [ref]$errors
        )
    }
    catch {
        Write-Host "Error in block starting at line $($i+1): $_" -ForegroundColor Red
        break
    }
    
    if ($errors) {
        Write-Host "ERROR at lines $($i+1) to $($end+1). First error line: $($errors[0].Extent.StartLineNumber + $i)" -ForegroundColor Red
    }
    else {
        Write-Host "OK: Lines $($i+1) to $($end+1)" -ForegroundColor Green
    }
}