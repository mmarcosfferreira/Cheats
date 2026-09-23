$content = Get-Content 'd:\Desenvolvimento\Power Sheel\ERP_GESTAO_REDUZIDA\ERP_GESTAO_REDUZIDA_backup_extreme.ps1'
$l = 0
$stack = New-Object System.Collections.Generic.Stack[int]
foreach ($line in $content) {
    $l++
    for ($i=0; $i -lt $line.Length; $i++) {
        if ($line[$i] -eq '{') { $stack.Push($l) }
        elseif ($line[$i] -eq '}') { if ($stack.Count -gt 0) { $null = $stack.Pop() } }
    }
}
Write-Host "OPEN_BRACES_COUT: $($stack.Count)"
$arr = $stack.ToArray()
[Array]::Reverse($arr)
foreach ($n in $arr) { Write-Host "LINE: $n" }
