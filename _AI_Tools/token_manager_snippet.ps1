
# ---------------------------------------------------------
# FUNÇÃO GERENCIADOR DE TOKENS (NOVA)
# ---------------------------------------------------------
function Show-TokenManager {
    param($refUser, $refToken)
    
    $tmForm = New-Object System.Windows.Forms.Form
    $tmForm.Text = "🔐 Gerenciador de Tokens GitHub"
    $tmForm.Size = "800, 500"
    $tmForm.StartPosition = "CenterScreen"
    $tmForm.BackColor = [System.Drawing.Color]::FromArgb(30, 30, 35)
    $tmForm.ForeColor = "White"
    $tmForm.FormBorderStyle = 'FixedToolWindow'

    # Layout Split
    $split = New-Object System.Windows.Forms.SplitContainer
    $split.Dock = "Fill"
    $split.SplitterDistance = 300
    $split.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 55)
    $tmForm.Controls.Add($split)

    # --- ESQUERDA: LISTA ---
    $pnlLeft = $split.Panel1
    $pnlLeft.Padding = New-Object System.Windows.Forms.Padding(10)

    $lblList = New-Object System.Windows.Forms.Label
    $lblList.Text = "🔑 Tokens Salvos"
    $lblList.Dock = "Top"
    $lblList.Height = 30
    $lblList.Font = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)
    $lblList.ForeColor = $Colors.Primary
    $pnlLeft.Controls.Add($lblList)
    
    $lstTokens = New-Object System.Windows.Forms.ListBox
    $lstTokens.Dock = "Fill"
    $lstTokens.BackColor = [System.Drawing.Color]::FromArgb(25, 25, 30)
    $lstTokens.ForeColor = "White"
    $lstTokens.BorderStyle = "FixedSingle"
    $lstTokens.Font = New-Object System.Drawing.Font("Segoe UI", 10)
    $pnlLeft.Controls.Add($lstTokens)
    
    # Botões Lista (Panel Bottom)
    $pnlListBtns = New-Object System.Windows.Forms.Panel
    $pnlListBtns.Dock = "Bottom"
    $pnlListBtns.Height = 100
    $pnlLeft.Controls.Add($pnlListBtns)

    $btnUse = New-Object System.Windows.Forms.Button
    $btnUse.Text = "✅ USAR SELECIONADO"
    $btnUse.Dock = "Top"
    $btnUse.Height = 40
    $btnUse.BackColor = [System.Drawing.Color]::FromArgb(40, 120, 60)
    $btnUse.FlatStyle = "Flat"
    $btnUse.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)
    $pnlListBtns.Controls.Add($btnUse)

    $btnDel = New-Object System.Windows.Forms.Button
    $btnDel.Text = "🗑️ EXCLUIR"
    $btnDel.Dock = "Bottom"
    $btnDel.Height = 35
    $btnDel.BackColor = [System.Drawing.Color]::FromArgb(150, 50, 50)
    $btnDel.FlatStyle = "Flat"
    $pnlListBtns.Controls.Add($btnDel)

    # --- DIREITA: NOVO E AJUDA ---
    $pnlRight = $split.Panel2
    $pnlRight.Padding = New-Object System.Windows.Forms.Padding(10)

    $lblNew = New-Object System.Windows.Forms.Label
    $lblNew.Text = "➕ Adicionar Novo Token"
    $lblNew.Location = "10, 10"; $lblNew.Size = "300, 30"
    $lblNew.Font = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)
    $pnlRight.Controls.Add($lblNew)

    # Campos
    $lblAlias = New-Object System.Windows.Forms.Label; $lblAlias.Text = "Nome (Apelido):"; $lblAlias.Location = "10, 50"; $lblAlias.Size = "150, 20"
    $txtAlias = New-Object System.Windows.Forms.TextBox; $txtAlias.Location = "10, 75"; $txtAlias.Size = "300, 25"; $txtAlias.BackColor = [System.Drawing.Color]::FromArgb(50, 50, 60); $txtAlias.ForeColor = "White"
    
    $lblUserTm = New-Object System.Windows.Forms.Label; $lblUserTm.Text = "Usuário GitHub:"; $lblUserTm.Location = "10, 110"; $lblUserTm.Size = "150, 20"
    $txtUserTm = New-Object System.Windows.Forms.TextBox; $txtUserTm.Location = "10, 135"; $txtUserTm.Size = "300, 25"; $txtUserTm.BackColor = [System.Drawing.Color]::FromArgb(50, 50, 60); $txtUserTm.ForeColor = "White"

    $lblTokenTm = New-Object System.Windows.Forms.Label; $lblTokenTm.Text = "Personal Access Token:"; $lblTokenTm.Location = "10, 170"; $lblTokenTm.Size = "200, 20"
    $txtTokenTm = New-Object System.Windows.Forms.TextBox; $txtTokenTm.Location = "10, 195"; $txtTokenTm.Size = "400, 25"; $txtTokenTm.BackColor = [System.Drawing.Color]::FromArgb(50, 50, 60); $txtTokenTm.ForeColor = "White"; $txtTokenTm.PasswordChar = "*"

    $btnSaveToken = New-Object System.Windows.Forms.Button
    $btnSaveToken.Text = "💾 SALVAR NA LISTA"
    $btnSaveToken.Location = "10, 235"; $btnSaveToken.Size = "150, 35"
    $btnSaveToken.BackColor = $Colors.Primary; $btnSaveToken.FlatStyle = "Flat"
    
    $pnlRight.Controls.Add($lblAlias); $pnlRight.Controls.Add($txtAlias)
    $pnlRight.Controls.Add($lblUserTm); $pnlRight.Controls.Add($txtUserTm)
    $pnlRight.Controls.Add($lblTokenTm); $pnlRight.Controls.Add($txtTokenTm)
    $pnlRight.Controls.Add($btnSaveToken)

    # AJUDA BOX
    $grpHelp = New-Object System.Windows.Forms.GroupBox
    $grpHelp.Text = "❓ COMO OBTER O TOKEN?"
    $grpHelp.Location = "10, 300"; $grpHelp.Size = "450, 150"
    $grpHelp.ForeColor = "Cyan"
    
    $lblHelpTxt = New-Object System.Windows.Forms.Label
    $lblHelpTxt.Text = "1. Clique no botão abaixo para abrir o GitHub.`n2. Crie um 'Classic' Token.`n3. Marque a permissão 'Repo'.`n4. Copie o código (ghp_...) e cole acima."
    $lblHelpTxt.Location = "15, 25"; $lblHelpTxt.Size = "420, 80"; $lblHelpTxt.ForeColor = "White"
    
    $btnOpenGit = New-Object System.Windows.Forms.Button
    $btnOpenGit.Text = "🌐 ABRIR GITHUB TOKENS"
    $btnOpenGit.Location = "15, 110"; $btnOpenGit.Size = "200, 30"
    $btnOpenGit.BackColor = [System.Drawing.Color]::FromArgb(64, 64, 64); $btnOpenGit.FlatStyle = "Flat"
    $btnOpenGit.Add_Click({ [System.Diagnostics.Process]::Start("https://github.com/settings/tokens") })

    $grpHelp.Controls.Add($lblHelpTxt)
    $grpHelp.Controls.Add($btnOpenGit)
    $pnlRight.Controls.Add($grpHelp)

    # Lógica de Dados
    $tokensList = @()
    if (Test-Path $script:GitHubTokensFile) {
        try { $tokensList = Load-JsonData $script:GitHubTokensFile } catch { $tokensList = @() }
    }
    
    # Atualizar Lista UI
    function Refresh-TokenList {
        $lstTokens.Items.Clear()
        if ($tokensList -is [System.Array]) {
            foreach ($t in $tokensList) {
                $lstTokens.Items.Add("$($t.Alias)  [$($t.User)]")
            }
        }
        elseif ($tokensList) {
            $lstTokens.Items.Add("$($tokensList.Alias)  [$($tokensList.User)]")
        }
    }
    
    Refresh-TokenList

    # Eventos
    $btnSaveToken.Add_Click({
            $alias = $txtAlias.Text
            $user = $txtUserTm.Text
            $token = $txtTokenTm.Text
        
            if (!$alias -or !$user -or !$token) { [System.Windows.Forms.MessageBox]::Show("Preencha todos os campos!"); return }
        
            $newItem = @{ Alias = $alias; User = $user; Token = $token }
        
            # Converter para ArrayList para facilitar
            $arr = [System.Collections.ArrayList]::new()
            if ($tokensList) { $arr.AddRange($tokensList) }
            $arr.Add($newItem)
        
            # Salvar
            $arr | ConvertTo-Json | Out-File $script:GitHubTokensFile -Encoding utf8
        
            # Reload global
            $tokensList = Load-JsonData $script:GitHubTokensFile
            Refresh-TokenList
            [System.Windows.Forms.MessageBox]::Show("Token salvo com sucesso!")
        
            # Limpar
            $txtAlias.Text = ""; $txtUserTm.Text = ""; $txtTokenTm.Text = ""
        })

    $btnDel.Add_Click({
            $idx = $lstTokens.SelectedIndex
            if ($idx -ge 0) {
                $arr = [System.Collections.ArrayList]::new()
                if ($tokensList) { $arr.AddRange($tokensList) }
                $arr.RemoveAt($idx)
            
                $arr | ConvertTo-Json | Out-File $script:GitHubTokensFile -Encoding utf8
                $tokensList = $arr
                Refresh-TokenList
            }
        })

    $btnUse.Add_Click({
            $idx = $lstTokens.SelectedIndex
            if ($idx -ge 0) {
                $sel = if ($tokensList -is [System.Array]) { $tokensList[$idx] } else { $tokensList }
                $refUser.Text = $sel.User
                $refToken.Text = $sel.Token
                $tmForm.Close()
            }
            else {
                [System.Windows.Forms.MessageBox]::Show("Selecione um token na lista à esquerda!")
            }
        })

    Apply-Theme $tmForm
    [void]$tmForm.ShowDialog()
}
