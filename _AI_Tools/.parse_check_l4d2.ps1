$errors = $null
[void][System.Management.Automation.Language.Parser]::ParseFile('d:\Desenvolvimento\Power Sheel\ERP_GESTAO_REDUZIDA\ERP_GESTAO_REDUZIDA_backup_extreme.ps1',[ref]$null,[ref]$errors)
if ($errors -and $errors.Count -gt 0) {
    foreach ($err in $errors) {
        Write-Output ("ERROR: {0} at line {1}, col {2}" -f $err.Message, $err.Extent.StartLineNumber, $err.Extent.StartColumn)
    }
    exit 1
} else {
    Write-Output 'PARSE_OK'
}
