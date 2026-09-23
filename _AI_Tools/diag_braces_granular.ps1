$file = "d:\Desenvolvimento\Power Sheel\ERP_GESTAO_REDUZIDA\ERP_GESTAO_REDUZIDA_EXTREME.PS1"
$content = Get-Content $file
$depth = 0
$stack = New-Object System.Collections.Generic.Stack[int]

for ($i=0; $i -lt $content.Count; $i++) {
    $ln = $i + 1
    $line = $content[$i]
    
    # Ignorar comentários e strings básicas
    $cleanLine = $line -replace '#.*$', ''
    # Este regex básico pode falhar em strings complexas, mas ajuda
    # $cleanLine = $cleanLine -replace "'[^']*'", "''"
    # $cleanLine = $cleanLine -replace '"[^"]*"', '""'
    
    $opens = [regex]::Matches($cleanLine, '\{').Count
    $closes = [regex]::Matches($cleanLine, '\}').Count
    
    if ($opens -gt 0 -or $closes -gt 0) {
        for ($j=0; $j -lt $opens; $j++) { $stack.Push($ln); $depth++ }
        for ($j=0; $j -lt $closes; $j++) { 
            if ($stack.Count -gt 0) { $stack.Pop() | Out-Null; $depth-- }
            else { Write-Host "Extra closing brace at line $ln" -ForegroundColor Red }
        }
    }
}

Write-Host "Final Depth: $depth"
if ($stack.Count -gt 0) {
    Write-Host "Top of stack (unclosed):"
    $arr = $stack.ToArray()
    # Mostrar os 20 mais recentes
    $arr[0..19] | % { Write-Host " - Line $_" }
}
