try {
    [void]([System.Management.Automation.Language.Parser]::ParseFile('d:\Desenvolvimento\Power Sheel\ERP_GESTAO_REDUZIDA\GIT_APP.ps1',[ref]$null,[ref]$null))
    Write-Output 'PARSE_OK'
    exit 0
} catch {
    Write-Output "PARSE_ERROR: $($_.Exception.Message)"
    exit 2
}
