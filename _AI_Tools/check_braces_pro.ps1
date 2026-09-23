$content = Get-Content 'd:\Desenvolvimento\Power Sheel\ERP_GESTAO_REDUZIDA\ERP_GESTAO_REDUZIDA_backup_extreme.ps1'
$depth = 0
$stack = New-Object System.Collections.Generic.Stack[int]
$inString = $false
$stringChar = ''

for ($l=0; $l -lt $content.Count; $l++) {
    $line = $content[$l]
    $lineNum = $l + 1
    
    for ($i=0; $i -lt $line.Length; $i++) {
        $char = $line[$i]
        
        # Ignorar caracteres escapados
        if ($char -eq '`' -and ($i + 1 -lt $line.Length)) {
            $i++
            continue
        }
        
        # Gerenciar strings
        if ($char -eq '"' -or $char -eq "'") {
            if (-not $inString) {
                $inString = $true
                $stringChar = $char
            }
            elseif ($char -eq $stringChar) {
                $inString = $false
            }
            continue
        }
        
        if (-not $inString) {
            if ($char -eq '{') {
                $depth++
                $stack.Push($lineNum)
            }
            elseif ($char -eq '}') {
                $depth--
                if ($stack.Count -gt 0) { $null = $stack.Pop() }
                if ($depth -lt 0) {
                    Write-Host "ERRO: Fecha chaves extra na linha $lineNum" -ForegroundColor Red
                    $depth = 0
                }
            }
        }
    }
}

Write-Host "PROFUNDIDADE_FINAL: $depth"
$arr = $stack.ToArray()
[Array]::Reverse($arr)
foreach ($n in $arr) {
    Write-Host "ABERTO_NA_LINHA: $n"
}
