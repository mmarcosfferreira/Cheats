$content = Get-Content 'd:\Desenvolvimento\Power Sheel\ERP_GESTAO_REDUZIDA\ERP_GESTAO_REDUZIDA_backup_extreme.ps1' -Raw
$opens = 0
$closes = 0
foreach ($char in $content.ToCharArray()) {
    if ($char -eq '{') { $opens++ }
    elseif ($char -eq '}') { $closes++ }
}
Write-Host "Raw Opens: $opens"
Write-Host "Raw Closes: $closes"
Write-Host "Difference: $($opens - $closes)"
