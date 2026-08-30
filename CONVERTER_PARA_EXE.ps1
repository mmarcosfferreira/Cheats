# ============================================================
# CONVERSOR PS1 -> EXE  (Win-PS2EXE / ps2exe)
# Execute este script como ADMINISTRADOR para gerar o EXE.
# ============================================================

$ErrorActionPreference = 'Stop'
$scriptDir  = Split-Path -Parent $MyInvocation.MyCommand.Path
$inputFile  = Join-Path $scriptDir "ERP_GESTAO_REDUZIDA_EXTREME.PS1"
$outputFile = Join-Path $scriptDir "ERP_GESTAO_REDUZIDA.exe"
$iconFile   = Join-Path $scriptDir "icon.ico"   # coloque seu .ico aqui (opcional)

# -- Verificar se ps2exe esta instalado --
if (-not (Get-Command Invoke-ps2exe -ErrorAction SilentlyContinue)) {
    Write-Host "[INFO] Instalando ps2exe..." -ForegroundColor Cyan
    Install-Module -Name ps2exe -Scope CurrentUser -Force -ErrorAction Stop
}

# -- Parametros de compilacao --
$params = @{
    InputFile   = $inputFile
    OutputFile  = $outputFile
    noConsole   = $true       # SEM janela de console (app WinForms)
    title       = "ERP Gestao Reduzida"
    version     = "1.0.0.0"
    company     = "Desenvolvimento"
    product     = "ERP Gestao Reduzida EXTREME"
    copyright   = "2026"
    requireAdmin = $false     # mude para $true se precisar de admin
}

# Adicionar icone se existir
if (Test-Path $iconFile) {
    $params['iconFile'] = $iconFile
    Write-Host "[INFO] Usando icone: $iconFile" -ForegroundColor Green
} else {
    Write-Host "[AVISO] icon.ico nao encontrado — EXE usara icone padrao" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  Compilando ERP_GESTAO_REDUZIDA.exe ..."   -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  Entrada : $inputFile"
Write-Host "  Saida   : $outputFile"
Write-Host ""

try {
    Invoke-ps2exe @params
    Write-Host ""
    Write-Host "[OK] EXE gerado com sucesso!" -ForegroundColor Green
    Write-Host "     $outputFile" -ForegroundColor Green
} catch {
    Write-Host ""
    Write-Host "[ERRO] Falha na compilacao: $_" -ForegroundColor Red
    exit 1
}

# -- Avisos pos-compilacao --
Write-Host ""
Write-Host "IMPORTANTE: Copie os seguintes arquivos/pastas para a mesma" -ForegroundColor Yellow
Write-Host "pasta do EXE gerado antes de executar:" -ForegroundColor Yellow
Write-Host "  data\          (banco de dados SQLite e configs)"
Write-Host "  lib\           (DLLs: Guna.UI2.dll, Tulpep.NotificationWindow.dll, etc.)"
Write-Host "  System.Data.SQLite.dll"
Write-Host "  Microsoft.Web.WebView2.*.dll  (se usar aba de video)"
Write-Host "  WebView2Loader.dll            (se usar aba de video)"
Write-Host ""
Write-Host "Estrutura esperada ao lado do EXE:" -ForegroundColor Cyan
Write-Host "  ERP_GESTAO_REDUZIDA.exe"
Write-Host "  System.Data.SQLite.dll"
Write-Host "  data\"
Write-Host "  lib\"
Write-Host "    Guna.UI2.dll"
Write-Host "    Tulpep.NotificationWindow.dll"
Write-Host ""
Write-Host "IMPORTANTE: INSTALAR WebView2 Runtime do Microsoft Edge (não basta copiar as DLLs)." -ForegroundColor Yellow
Write-Host "Baixar em: https://developer.microsoft.com/microsoft-edge/webview2" -ForegroundColor Yellow
Write-Host ""
pause
