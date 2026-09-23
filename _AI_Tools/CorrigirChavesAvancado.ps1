# CorrigirChavesAvancado.ps1
# Script para corrigir automaticamente blocos de chaves em scripts PowerShell grandes
# Ele tenta balancear { e } e inserir chaves faltantes em locais prováveis, com relatório detalhado

param(
    [string]$Arquivo = "ERP_GESTAO_REDUZIDA_EXTREME.PS1"
)

# Lê todas as linhas do arquivo
$linhas = Get-Content $Arquivo -Raw -Encoding UTF8 -ErrorAction Stop -ReadCount 0 | Out-String | Select-String ".*" -AllMatches | ForEach-Object { $_.Matches.Value }

# Pilha para rastrear blocos
$pilha = @()
$saida = @()
$linhasInseridas = @()

for ($i = 0; $i -lt $linhas.Count; $i++) {
    $linha = $linhas[$i]
    $saida += $linha
    if ($linha -match "\{\s*$") {
        $pilha += $i
    }
    if ($linha -match "^\s*\}") {
        if ($pilha.Count -gt 0) {
            $null = $pilha[-1]
            $pilha = $pilha[0..($pilha.Count-2)]
        } else {
            # Chave fechando sem abrir, ignora
        }
    }
}

# Se restaram blocos abertos, inserir chaves no final
if ($pilha.Count -gt 0) {
    foreach ($idx in $pilha) {
        $saida += "} # <-- Inserida automaticamente para fechar bloco iniciado na linha $($idx+1)"
        $linhasInseridas += $idx+1
    }
}

# Salva arquivo corrigido
$novo = "$Arquivo.corrigido.ps1"
$saida | Set-Content $novo -Encoding UTF8

Write-Host "Arquivo corrigido salvo como: $novo"
if ($linhasInseridas.Count -gt 0) {
    Write-Host "Chaves inseridas automaticamente após as linhas: $($linhasInseridas -join ', ')"
} else {
    Write-Host "Nenhuma chave foi inserida. O arquivo já estava balanceado."
}
