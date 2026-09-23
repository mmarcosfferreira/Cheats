$file = "d:\Desenvolvimento\Power Sheel\ERP_GESTAO_REDUZIDA\ERP_GESTAO_REDUZIDA_EXTREME.PS1"
$content = Get-Content $file
$open = 0
$stack = New-Object System.Collections.Generic.Stack[int]
$ln = 0

foreach ($line in $content) {
    $ln++
    $cleanLine = $line -replace '#.*$', ''  # Ignorar comentários simples
    # Regex para ignorar strings é mais complexo, mas vamos tentar o básico primeiro
    
    $opens = [regex]::Matches($cleanLine, '\{').Count
    $closes = [regex]::Matches($cleanLine, '\}').Count
    
    for ($i=0; $i -lt $opens; $i++) { $stack.Push($ln); $open++ }
    for ($i=0; $i -lt $closes; $i++) { 
        if ($stack.Count -gt 0) { $stack.Pop() | Out-Null }
        $open-- 
    }
}

Write-Host "Total imbalance: $open"
if ($stack.Count -gt 0) {
    Write-Host "Unclosed blocks started at lines:"
    $stack.ToArray() | ForEach-Object { Write-Host " - Line $_" }
}
