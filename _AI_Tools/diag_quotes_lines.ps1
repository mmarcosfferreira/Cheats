$file = "d:\Desenvolvimento\Power Sheel\ERP_GESTAO_REDUZIDA\ERP_GESTAO_REDUZIDA_EXTREME.PS1"
$lines = Get-Content $file
$ln = 0
$total_dq = 0

foreach ($line in $lines) {
    $ln++
    # Ignorar comentários (regra simples)
    $cleanLine = $line -replace '#.*$', ''
    # Contar aspas duplas, ignorando aspas escapadas como `"
    # No PowerShell, o escape é backtick `, mas em strings de aspas duplas, "" também escapa "
    # Vamos contar todas e ver onde o acumulado fica ímpar
    $dq_in_line = [regex]::Matches($cleanLine, '"').Count
    $total_dq += $dq_in_line
    
    if ($dq_in_line % 2 -ne 0) {
        Write-Host "Line $ln has odd number of double quotes ($dq_in_line): $line" -ForegroundColor Yellow
    }
}

Write-Host "Done. Total DQ: $total_dq"
