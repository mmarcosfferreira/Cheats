$content = Get-Content 'd:\Desenvolvimento\Power Sheel\ERP_GESTAO_REDUZIDA\ERP_GESTAO_REDUZIDA_backup_extreme.ps1'
$depth = 0
$lineNum = 0
$stack = New-Object System.Collections.Generic.Stack[int]

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
            if ($stack.Count -gt 0) { $null = $stack.Pop() }
        }
    }
}

Write-Host "DEPTH_FINAL: $depth"
if ($stack.Count -gt 0) {
    Write-Host "UNCLOSED_LINES:"
    $arr = $stack.ToArray()
    [Array]::Reverse($arr)
    foreach ($l in $arr) {
        Write-Host "LINE $l"
    }
}
