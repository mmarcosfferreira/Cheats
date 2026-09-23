# Script de Correção de Chaves para PowerShell
# Este script tenta corrigir automaticamente problemas de chaves não fechadas ou extras em um arquivo PowerShell.
# Uso: Execute este script no mesmo diretório do arquivo alvo ou ajuste o caminho do arquivo.

$arquivo = "D:\Desenvolvimento\Power Sheel\ERP_GESTAO_REDUZIDA\ERP_GESTAO_REDUZIDA_EXTREME.PS1"

# Lê todo o conteúdo do arquivo
$linhas = Get-Content -Path $arquivo -Raw -Encoding UTF8

# Conta as chaves de abertura e fechamento
$abertas = ([regex]::Matches($linhas, "{", 'Multiline')).Count
$fechadas = ([regex]::Matches($linhas, "}", 'Multiline')).Count

Write-Host "Chaves de abertura: $abertas"
Write-Host "Chaves de fechamento: $fechadas"

if ($abertas -gt $fechadas) {
    $faltam = $abertas - $fechadas
    Write-Host "Faltam $faltam chaves de fechamento. Adicionando ao final do arquivo..." -ForegroundColor Yellow
    Add-Content -Path $arquivo -Value ("}`n" * $faltam)
    Write-Host "Chaves de fechamento adicionadas."
} elseif ($fechadas -gt $abertas) {
    $sobram = $fechadas - $abertas
    Write-Host "Há $sobram chaves de fechamento a mais. Removendo do final do arquivo..." -ForegroundColor Yellow
    # Remove as chaves extras do final
    $linhasArr = $linhas -split "`n"
    $removidas = 0
    for ($i = $linhasArr.Count - 1; $i -ge 0 -and $removidas -lt $sobram; $i--) {
        if ($linhasArr[$i].Trim() -eq "}") {
            $linhasArr = $linhasArr[0..($i-1)] + $linhasArr[($i+1)..($linhasArr.Count-1)]
            $removidas++
        }
    }
    Set-Content -Path $arquivo -Value ($linhasArr -join "`n")
    Write-Host "Chaves de fechamento removidas."
} else {
    Write-Host "O número de chaves está correto. Nenhuma alteração necessária." -ForegroundColor Green
}

Write-Host "Correção automática finalizada. Recomenda-se revisar o código manualmente para garantir a lógica."
