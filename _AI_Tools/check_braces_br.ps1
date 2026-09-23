$content = Get-Content 'd:\Desenvolvimento\Power Sheel\ERP_GESTAO_REDUZIDA\ERP_GESTAO_REDUZIDA_backup_extreme.ps1'
$depth = 0
$stack = New-Object System.Collections.Generic.Stack[int]
$lineNum = 0

foreach ($line in $content) {
    $lineNum++
    for ($i = 0; $i -lt $line.Length; $i++) {
        $char = $line[$i]
        if ($char -eq '{') {
            $depth++
            $stack.Push($lineNum)
        }
        elseif ($char -eq '}') {
            $depth--
            if ($stack.Count -gt 0) {
                $null = $stack.Pop()
            }
            if ($depth -lt 0) {
                Write-Host "ERRO: Fecha chaves a mais na linha $lineNum" -ForegroundColor Red
                $depth = 0 # reset to continue
            }
        }
    }
}

Write-Host "Profundidade final: $depth"
if ($stack.Count -gt 0) {
    Write-Host "Chaves não fechadas iniciadas nas linhas:"
    $arr = $stack.ToArray()
    [Array]::Reverse($arr)
    foreach ($l in $arr) {
        $trimmed = $content[$l-1].Trim()
        Write-Host "Linha $l: $trimmed"
    }
}
