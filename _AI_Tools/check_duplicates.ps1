$filePath = 'd:\Desenvolvimento\Power Sheel\ERP_GESTAO_REDUZIDA\ERP_GESTAO_REDUZIDA_backup_extreme.ps1'
$content = Get-Content $filePath -Raw
$errors = $null
$ast = [System.Management.Automation.Language.Parser]::ParseInput($content, [ref]$null, [ref]$errors)

$functions = $ast.FindAll({ $args[0] -is [System.Management.Automation.Language.FunctionDefinitionAst] }, $true)
$groups = $functions | Group-Object Name
$duplicates = $groups | Where-Object { $_.Count -gt 1 }

if ($duplicates) {
    Write-Host "FUNÇÕES DUPLICADAS ENCONTRADAS:" -ForegroundColor Red
    foreach ($dup in $duplicates) {
        Write-Host "Função: $($dup.Name) ($($dup.Count) vezes)" -ForegroundColor Yellow
        foreach ($item in $dup.Group) {
            Write-Host "   Linha: $($item.Extent.StartLineNumber)"
        }
    }
} else {
    Write-Host "NENHUMA FUNÇÃO DUPLICADA ENCONTRADA." -ForegroundColor Green
}
