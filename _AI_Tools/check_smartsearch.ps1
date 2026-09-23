$content = Get-Content 'd:\Desenvolvimento\Power Sheel\ERP_GESTAO_REDUZIDA\ERP_GESTAO_REDUZIDA_backup_extreme.ps1'
$depth = 0
$inShowSmartSearch = $false

for ($l=0; $l -lt $content.Count; $l++) {
    $line = $content[$l]
    $lineNum = $l + 1
    
    if ($line -match 'function Show-SmartSearch \{') {
        $inShowSmartSearch = $true
        $depth = 1
        Write-Host "INICIO Show-SmartSearch na linha $lineNum"
        continue
    }
    
    if ($inShowSmartSearch) {
        for ($i=0; $i -lt $line.Length; $i++) {
            $char = $line[$i]
            if ($char -eq '{') { $depth++ }
            elseif ($char -eq '}') { 
                $depth-- 
                if ($depth -eq 0) {
                    Write-Host "FIM Show-SmartSearch na linha $lineNum"
                    $inShowSmartSearch = $false
                    break
                }
            }
        }
    }
}

if ($inShowSmartSearch) {
    Write-Host "Show-SmartSearch NÃO TERMINOU! Profundidade residual: $depth" -ForegroundColor Red
}
