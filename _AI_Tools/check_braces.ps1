# Teste de carregamento incremental
$file = "D:\Desenvolvimento\Power Sheel\ERP_GESTAO_REDUZIDA\ERP_GESTAO_REDUZIDA_EXTREME.PS1"
$content = Get-Content $file -Raw

# Contar chaves
$openBraces = ([regex]::Matches($content, '(?<!`)\{')).Count
$closeBraces = ([regex]::Matches($content, '(?<!`)\}')).Count

Write-Host "Total lines: $((Get-Content $file).Count)"
Write-Host "Open braces: $openBraces"
Write-Host "Close braces: $closeBraces"

# Verificar balanceamento
if ($openBraces -eq $closeBraces) {
    Write-Host "Braces are balanced!" -ForegroundColor Green
} else {
    Write-Host "Braces MISMATCH! Difference: $($openBraces - $closeBraces)" -ForegroundColor Red
}