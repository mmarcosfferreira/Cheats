$file = "d:\Desenvolvimento\Power Sheel\ERP_GESTAO_REDUZIDA\ERP_GESTAO_REDUZIDA_EXTREME.PS1"
$lines = Get-Content $file
$ln = 0

foreach ($line in $lines) {
    $ln++
    if ($ln -gt 11200) { break }
    
    # Ignorar comentários (regra simples)
    $cleanLine = $line -replace '#.*$', ''
    # Contar aspas duplas, ignorando aspas escapadas `", e aspas dentro de aspas simples
    # No PowerShell: '...' protege tudo. "..." permite `".
    
    # Remover strings de aspas simples para não contar aspas duplas dentro delas
    $noSQ = [regex]::Replace($cleanLine, "'[^']*'", "''")
    # Agora contar aspas duplas
    $dq_count = [regex]::Matches($noSQ, '"').Count
    
    if ($dq_count % 2 -ne 0) {
        if ($line -notmatch '@"' -and $line -notmatch '"@') {
             Write-Host "Line $ln has odd number of DQs ($dq_count): $line" -ForegroundColor Red
        } else {
             # Herestrings são mais complexas, vamos apenas avisar
             Write-Host "Line $ln has herestring marker: $line" -ForegroundColor Yellow
        }
    }
}
