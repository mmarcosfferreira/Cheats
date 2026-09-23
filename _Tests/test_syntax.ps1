# Teste incremental de sintaxe
$file = "D:\Desenvolvimento\Power Sheel\ERP_GESTAO_REDUZIDA\ERP_GESTAO_REDUZIDA_EXTREME.PS1"
$lines = Get-Content $file

# Testar em blocos de 2000 linhas
for ($i = 0; $i -lt $lines.Count; $i += 2000) {
    $end = [Math]::Min($i + 1999, $lines.Count - 1)
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
        Write-Host "Syntax error in block starting at line $($i+1), error at line: $($errors[0].Extent.StartLineNumber + $i)" -ForegroundColor Red
        break
    }
    else {
        Write-Host "OK: Lines $($i+1) to $($end+1)" -ForegroundColor Green
    }
}