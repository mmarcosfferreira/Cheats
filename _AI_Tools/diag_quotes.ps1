$file = "d:\Desenvolvimento\Power Sheel\ERP_GESTAO_REDUZIDA\ERP_GESTAO_REDUZIDA_EXTREME.PS1"
$content = Get-Content $file -Raw
$sq = [regex]::Matches($content, "'").Count
$dq = [regex]::Matches($content, '"').Count

Write-Host "Single quotes: $sq (Balanced: $($sq % 2 -eq 0))"
Write-Host "Double quotes: $dq (Balanced: $($dq % 2 -eq 0))"

if ($sq % 2 -ne 0 -or $dq % 2 -ne 0) {
    Write-Host "Imbalance detected!" -ForegroundColor Red
    # Localizar a linha do possível problema é difícil mas vamos tentar por blocos
    $lines = Get-Content $file
    $ln = 0
    $sq_count = 0
    $dq_count = 0
    foreach ($line in $lines) {
        $ln++
        $sq_count += [regex]::Matches($line, "'").Count
        $dq_count += [regex]::Matches($line, '"').Count
        # Se um comentário termina a linha, ignoramos o que vem depois
    }
}
