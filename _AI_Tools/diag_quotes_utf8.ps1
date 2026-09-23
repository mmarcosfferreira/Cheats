$file = "d:\Desenvolvimento\Power Sheel\ERP_GESTAO_REDUZIDA\ERP_GESTAO_REDUZIDA_EXTREME.PS1"
$lines = Get-Content $file -Encoding UTF8
$ln = 0

foreach ($line in $lines) {
    $ln++
    $dq = [regex]::Matches($line, '"').Count
    if ($dq % 2 -ne 0) {
        if ($line -notmatch '@"' -and $line -notmatch '"@') {
            Write-Host "Line $ln (UTF8): $line" -ForegroundColor Red
        }
    }
}
