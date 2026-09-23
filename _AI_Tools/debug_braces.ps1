$content = Get-Content 'd:\Desenvolvimento\Power Sheel\ERP_GESTAO_REDUZIDA\ERP_GESTAO_REDUZIDA_backup_extreme.ps1'
$depth = 0
$lineNum = 0
foreach ($line in $content) {
    $lineNum++
    if ($lineNum -lt 9680) { continue }
    if ($lineNum -gt 13000) { break }
    
    # Simple count of braces, ignoring them inside strings if possible, but for now simple count
    $opens = $line.Split('{').Count - 1
    $closes = $line.Split('}').Count - 1
    
    $prevDepth = $depth
    $depth += ($opens - $closes)
    
    if ($opens -gt 0 -or $closes -gt 0) {
        Write-Host "$lineNum ($depth): $line"
    }
    
    if ($depth -lt -10) { 
        Write-Host "CRITICAL: Depth dropped too low at line $lineNum"
        break
    }
}
Write-Host "Final depth at 13000: $depth"
