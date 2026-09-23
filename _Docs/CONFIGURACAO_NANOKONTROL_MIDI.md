# Configuração nanoKONTROL2 para ERP_GESTAO_REDUZIDA_EXTREME

## 🎯 O Que Você Pode Fazer

✅ **Mapear MinimizeRestoreToggle em qualquer botão** do nanoKONTROL2  
✅ **Minimize uma única vez** por clique - SEM loop infinito  
✅ **NextTrack/PrevTrack** respondem em 50ms  
✅ **Autoconectar** automaticamente ao iniciar o app  

---

## ⚡ Começar Rápido

### Mapear MinimizeRestoreToggle em Qualquer Botão:

1. **Menu > MIDI > Editar Mapeamento**
2. **Procure seção "Sistema"** (vermelho)
3. **Clique em "MinimizeRestoreToggle"**
4. **Pressione o botão do nanoKONTROL2** que deseja usar
5. ✓ **Pronto!** Botão agora minimiza/restaura a janela

**Botões recomendados**: SET (padrão), M1, M7, M8, ou qualquer vazio (61, 62)

👉 **Ver exemplos práticos em**: `EJEMPLOS_MAPEAMENTO_NANOKONTROL.md`

---

## 🔧 Melhorias Implementadas

### 1. **Minimize/Restore Toggle via MIDI** ⭐ (Otimizado - Sem Loop)
✅ Novo recurso: Minimizar e restaurar a janela ERP_GESTAO_REDUZIDA_EXTREME usando um botão MIDI do nanoKONTROL2

- **Ação MIDI**: `MinimizeRestoreToggle`
- **Botão padrão mapeado**: `Botão 60 (SET Marker)` no nanoKONTROL2
- **Execuação**: ONE-SHOT (executa UMA ÚNICA VEZ por clique - sem loop infinito!)
- **Debounce**: 800ms (muito tempo para evitar re-disparo acidental)
- **Função**: 
  - Ao pressionar: minimiza a janela para a bandeja do sistema
  - Ao pressionar novamente (após 800ms): restaura a janela maximizada

**⚠️ Importante**: 
- Essa ação foi otimizada para evitar o problema anterior onde a janela abria e fechava em loop infinito
- O debounce de 800ms garante que um clique acidental não cause múltiplas acionamentos

### 2. **Toggle de Repeat com 4 Estados** 🔄
✅ Disponível: 4 botões independentes para controlar o modo de repetição

**Opções disponíveis**:
- **ToggleRepeat**: Alterna entre os 4 estados em sequência
  - OFF → ONE → ALL → OFF → ONE...
  
- **RepeatOne**: Define modo repetir UMA música
  - Ideal para aprender/decorar uma música

- **RepeatAll**: Define modo repetir TODAS as músicas em loop
  - Ideal para playlists

- **RepeatOff**: Desabilita repetição
  - Toca até o final e para

**Como usar no nanoKONTROL2**:
1. Abra `Menu > Configurações > MIDI > Conectar`
2. Procure pela seção **"Repeat"** (cor roxo/magenta)
3. Escolha qual botão MIDI do nanoKONTROL2 deve controlar qual modo
4. Exemplo: Botão M5 (posição) → **ToggleRepeat** (alterna entre os 4 modos)

---

### 3. **Resposta Mais Rápida para Mudar Música**
✅ Otimizado: NextTrack e PrevTrack agora respondem em **50ms** ao invés de **150ms**

**Antes**: Precisava pressionar várias vezes porque havia debounce de 150ms
**Depois**: Agora responde ao primeiro clique com apenas 50ms de espera

### 4. **Autoconexão Automática do nanoKONTROL2** ⭐
✅ **NOVO**: O nanoKONTROL2 agora se conecta automaticamente quando você inicia o app!

**Antes**: Precisava ir em Configurações > MIDI > Conectar toda vez
**Depois**: App verifica se há dispositivo configurado e conecta automaticamente ao iniciar

---

## � Como Funciona a Autoconexão

### Inicialização Automática:

1. **Ao iniciar o app**:
   - App carrega o arquivo `data/midi_config.json`
   - Se houver um ID de dispositivo salvo, tenta conectar automaticamente
   - Quando o Form é mostrado, a conexão MIDI é estabelecida

2. **Na primeira execução**:
   - Nenhum dispositivo está configurado
   - App aguarda você conectar manualmente em `Configurações > MIDI`
   - Uma vez conectado, o dispositivo é salvo em `midi_config.json`

3. **Nas próximas inicializações**:
   - ✅ App conecta automaticamente sem você fazer nada!
   - Se o dispositivo não estiver disponível, aparece aviso amigável
   - Você ainda pode reconectar manualmente se necessário

### Como Verificar se Autoconexão Funcionou:

1. **Verifique os logs** (Menu > Ferramentas > Ver Logs Debug):
   - Procure por: `"[MIDI] nanoKONTROL2 autoconectado!"`
   - Ou: `"[MIDI] Tentando autoconectar no dispositivo..."`

2. **Procure pela notificação** (canto inferior direito):
   - ✓ MIDI: nanoKONTROL2 autoconectado!
   - ⚠ MIDI: Falha ao autoconectar (dispositivo não encontrado)

3. **Teste pressionando um botão MIDI**:
   - NextTrack (>>) deveria pular para próxima música
   - SET deveria minimizar a janela

---

## 📋 Como Mapear MinimizeRestoreToggle em Qualquer Botão

### Método 1: Abrir o Formulário MIDI (Recomendado)

1. **Inicie o app** com o nanoKONTROL2 conectado
2. Vá em **Menu > Configurações > MIDI > Conectar** 
   - (Se já estiver conectado, vá direto em **Menu > MIDI > Editar Mapeamento**)
3. **Procure pela seção "Sistema"** (cor vermelha/laranja)
4. Você verá os botões disponíveis:
   - ToggleWindow
   - **MinimizeRestoreToggle** ← Este é o que você quer!
   - ToggleGadget
   - OpenL4D2
   - OpenGitHub

5. **Clique em "MinimizeRestoreToggle"** e será aberto um picker de botões

6. **Clique no botão físico do nanoKONTROL2** que deseja usar:
   - Pode ser qualquer botão: SET, RECORD, M1-M8, Anterior, Próximo, etc.
   - O app vai detectar qual botão você pressionou

7. **Pronto!** O botão escolhido agora executa MinimizeRestoreToggle

### Exemplo Prático:

**Quer usar o botão M1 para minimizar/restaurar?**

1. Abra MIDI Config (Menu > MIDI > Editar Mapeamento)
2. Procure seção "Sistema" → "MinimizeRestoreToggle"
3. Clique em "MinimizeRestoreToggle"
4. Pressione o botão **M1** do nanoKONTROL2 no monitor
5. ✓ Pronto! M1 agora minimiza/restaura a janela

### Método 2: Editar JSON Diretamente (Avançado)

Se preferir editar manualmente, abra `data/midi_config.json`:

```json
{
  "DeviceId": 0,
  "Map": {
    "48": "MinimizeRestoreToggle"  // M1 = note 48
  }
}
```

**IDs de botões úteis do nanoKONTROL2:**
- 41: PLAY
- 42: STOP
- 43: REWIND (<<)
- 44: FORWARD (>>)
- 45: RECORD
- 46: CYCLE
- 48-55: Mute buttons (M1-M8)
- 58: |<< Track Prev
- 59: >>| Track Next
- 60: SET (padrão)

---

### Como Funciona o Toggle:

```
1º Clique em qualquer botão mapeado → Janela minimiza para bandeja
   (aguarda 800ms)
   ↓
2º Clique no mesmo botão → Janela restaura maximizada
   (aguarda 800ms)
   ↓
3º Clique → Minimiza novamente (e assim por diante)
```

**Importante**: 
- A ação executa **UMA VEZ** por clique (sem loop!)
- O debounce de 800ms evita acionamentos acidentais
- Funciona com qualquer botão do nanoKONTROL2

---

---

## 🎵 Testando MinimizeRestoreToggle e NextTrack/PrevTrack

## 🎮 Guia Rápido: Como Mapear MinimizeRestoreToggle

### Passo-a-Passo Visual:

**1. Abra o Menu MIDI Config:**
```
App → Menu → MIDI → Editar Mapeamento
(ou Menu > Configurações > MIDI > Conectar se ainda não estiver conectado)
```

**2. Procure pela seção "Sistema" (cor vermelha):**
```
┌─────────────────────────────────────────────────────┐
│ AÇÕES MIDI - PICKER                                 │
├─────────────────────────────────────────────────────┤
│ Sistema: [ToggleWindow] [MinimizeRestoreToggle] ... │ ← Aqui!
└─────────────────────────────────────────────────────┘
```

**3. Clique em "MinimizeRestoreToggle":**
```
Vai abrir a tela para você escolher qual botão do nanoKONTROL2
```

**4. Pressione o botão do nanoKONTROL2 que deseja usar:**
```
Exemplos:
- SET (padrão)
- M1, M2, M3... M8
- RECORD
- CYCLE
- << Anterior
- >> Próximo
- Qualquer outro botão!
```

**5. Pronto!** O botão agora executa MinimizeRestoreToggle

---

### Referência de Botões nanoKONTROL2:

**Botões de Transporte:**
| ID | Nome | Função Padrão |
|----|------|---------------|
| 41 | PLAY | PlayPause |
| 42 | STOP | Stop |
| 43 | REWIND << | PrevTrack |
| 44 | FORWARD >> | NextTrack |
| 45 | RECORD | ToggleShuffle |
| 46 | CYCLE | ToggleRepeat |

**Botões de Controle (M1-M8):**
| ID | Nome | Função Padrão |
|----|------|---------------|
| 48 | M1 | VolDown |
| 49 | M2 | VolUp |
| 50 | M3 | ToggleMute |
| 51 | M4 | ToggleShuffle |
| 52 | M5 | ToggleRepeat |
| 53 | M6 | ToggleSearchPlaylist |
| 54 | M7 | PrevTrack |
| 55 | M8 | NextTrack |

**Botões Adicionais:**
| ID | Nome | Função Padrão |
|----|------|---------------|
| 58 | \|<< Track Prev | PrevTrack |
| 59 | >>\| Track Next | NextTrack |
| 60 | SET | MinimizeRestoreToggle (padrão) |
| 61 | << Marker | (vazio) |
| 62 | >> Marker | (vazio) |

**💡 Dica:** Botões vazios (61, 62, e alguns M-buttons) são ideais para mapear MinimizeRestoreToggle sem sobrescrever funções importantes!

---

### Teste Rápido Após Mapear:

1. **Pressione o botão uma vez** → Janela minimiza ✓
2. **Espere 800ms** (tempo de segurança)
3. **Pressione novamente** → Janela restaura ✓
4. **Sem hesitações ou loops!** ✓



1. **Encontre o botão mapeado** com MinimizeRestoreToggle

2. **Pressione uma única vez**:
   - ✅ Janela deve minimizar para a bandeja **IMEDIATAMENTE**
   - ❌ Não deve hesitar ou piscar
   - ❌ Não deve abrir/fechar em loop

3. **Espere pelo menos 800ms** (tempo de debounce)

4. **Pressione o mesmo botão novamente**:
   - ✅ Janela deve restaurar maximizada **IMEDIATAMENTE**
   - ❌ Não deve exigir múltiplos cliques presentes

### Teste de Resposta NextTrack/PrevTrack:

1. **Coloque uma música tocando** no app

2. **Pressione << (Anterior)** uma única vez
   - ✅ Deve pular para música anterior **IMEDIATAMENTE**
   - ❌ Não deve exigir múltiplos cliques
   - ❌ Não deve travar

3. **Pressione >> (Próximo)** uma única vez
   - ✅ Deve pular para próxima música **IMEDIATAMENTE**
   - ❌ Não deve exigir múltiplos cliques

### Se Ainda Estiver Lento:

Verifique:
- ✅ App está em foco (ou configurado para hotkeys globais)
- ✅ nanoKONTROL2 está conectado corretamente
- ✅ Não há outro software conflitando com MIDI
- ✅ O debounce está correto (50ms para NextTrack/PrevTrack, 800ms para MinimizeRestore)

---

## 📊 Resumo das Mudanças de Código

### Arquivo: `ERP_GESTAO_REDUZIDA_EXTREME.PS1`

#### Mudança 1: Novo Mapeamento MIDI
```powershell
60 = 'MinimizeRestoreToggle'  # SET Marker (reutilizado como Minimize/Restore)
```

#### Mudança 2: Debounce Otimizado
```powershell
# Próxima/Anterior faixa usam 50ms (antes era 150ms para todas)
$debounceTime = if ($Action -in 'NextTrack', 'PrevTrack') { 50 } else { 150 }
```

#### Mudança 3: Nova Ação MIDI
```powershell
'MinimizeRestoreToggle' {
    # Toggle inteligente com minimização para bandeja
    $isVisible = $Form.Visible -and $Form.WindowState -ne [System.Windows.Forms.FormWindowState]::Minimized
    if ($isVisible) {
        Hide-MainFormToTray  # Esconde para bandeja
    } else {
        Show-MainFormTopmost  # Restaura maximizado
    }
}
```

#### Mudança 1: Novo Mapeamento MIDI
```powershell
60 = 'MinimizeRestoreToggle'  # SET Marker (reutilizado como Minimize/Restore - ONE-SHOT)
```

#### Mudança 2: Debounce Otimizado (Incluindo MinimizeRestoreToggle)
```powershell
# Debounce customizável por ação:
# - NextTrack/PrevTrack: 50ms (resposta rápida)
# - MinimizeRestoreToggle: 800ms (one-shot, evita loop)
# - Outras ações: 150ms (padrão)

$debounceTime = switch ($Action) {
    'NextTrack' { 50 }
    'PrevTrack' { 50 }
    'MinimizeRestoreToggle' { 800 }  # Muito tempo para evitar re-disparo
    default { 150 }
}
```

#### Mudança 3: Nova Ação MIDI - MinimizeRestoreToggle (Melhorada)
```powershell
'MinimizeRestoreToggle' {
    # Edge detection: executa uma única vez por clique (debounce de 800ms evita re-disparo)
    $isVisible = $Form.Visible -and $Form.WindowState -ne [System.Windows.Forms.FormWindowState]::Minimized
    
    if ($isVisible) {
        Add-ScanLogMessage ">> MIDI: Janela minimizada (via botão SET)"
        Hide-MainFormToTray  # Esconde para bandeja (ONE-SHOT!)
    }
    else {
        Add-ScanLogMessage ">> MIDI: Janela restaurada (via botão SET)"
        Show-MainFormTopmost  # Restaura maximizado (ONE-SHOT!)
    }
}
```

#### Mudança 4: Edge Detection com LastHotkeyState
```powershell
# Adicionado ao lastHotkeyState:
$script:LastHotkeyState = @{
    ToggleKey      = $false
    NextTrack      = $false
    PreviousTrack  = $false
    MinimizeRestore = $false  # Edge detection para MinimizeRestoreToggle (uma única vez)
}
```
```powershell
# No evento Form.Add_Shown (após UI estar completamente carregada)
$Form.Add_Shown({
    # ... código existente ...
    
    # ============================
    # AUTOCONEXÃO MIDI - nanoKONTROL2
    # ============================
    if ($script:MidiDeviceId -ge 0) {
        $devList = Get-MidiDevices
        if ($devList -and $devList.Count -gt $script:MidiDeviceId) {
            if (Start-MidiInput -DeviceId $script:MidiDeviceId) {
                Add-ScanLogMessage "✓ MIDI: nanoKONTROL2 autoconectado!"
            }
        }
    }
})
```

---

## 💡 Dicas Importantes

### Autoconexão Automática - Como Funciona:
- Quando você inicia o app, ele lê o arquivo `data/midi_config.json`
- Se houver um `DeviceId` salvo, tenta conectar automaticamente
- A tentativa acontece quando o Form é mostrado (Add_Shown event)
- Log de sucesso/erro é exibido no console debug

### Primeira Vez Usando:
1. Conecte o nanoKONTROL2 via USB ao computador
2. Inicie o app ERP_GESTAO_REDUZIDA_EXTREME
3. Abra Menu > MIDI > Conectar
4. O app vai listar os dispositivos MIDI disponíveis
5. Procure por "nanoKONTROL" e clique em Conectar
6. ✅ Agora está salvo! Na próxima vez, conectará automaticamente

### Desabilitar Autoconexão:
Se quiser desabilitar a autoconexão:
- Delete o arquivo `data/midi_config.json`
- Ou edite-o e remova o `DeviceId`
- Na próxima inicialização, não tentará conectar automaticamente

### Minimize para Bandeja (Economiza Memória)
- O app continua tocando música quando minimizado
- Os hotkeys globais funcionam mesmo minimizado
- Timers não essenciais são pausados (economia de CPU)

### Desbounce de 50ms é Suficiente?
- Sim! 50ms é responsivo para trocas de música rápidas
- Evita que um clique acidental cause múltiplas ações
- Está otimizado para uso com mouse gaming (ex: Logitech G604)

### Como Salvar Configuração MIDI
- Ao pressionar "OK" no diálogo de MIDI Config
- Ou automaticamente, o arquivo `midi_config.json` é salvo

---

## 🚀 Próximas Otimizações (Futuro)

Possíveis melhorias:
- [ ] Detecção de duplo-clique para ações rápidas
- [ ] Botão MIDI com feedback LED (se nanoKONTROL suportar)
- [ ] Rotina automática para otimizar debounce por tipo de ação

---

## ❓ Troubleshooting

### Problema: Autoconexão não funciona na inicialização
**Solução**: 
1. Verifique se o arquivo `data/midi_config.json` existe
2. Abra em um editor de texto e procure por `"DeviceId"`
3. Conecte manualmente em Menu > MIDI para salvar o ID do dispositivo
4. Se o arquivo não existir, será criado após a primeira conexão manual

### Problema: Minimize não funciona
**Solução**: 
1. Verifique se `MinimizeToTray = true` em `hotkey_config.json`
2. Reconfigure o mapeamento MIDI para o botão 60

### Problema: NextTrack/PrevTrack ainda lento
**Solução**: 
1. Verifique o debounce em Dispatch-MidiAction (deve ser 50ms)
2. Teste se o nanoKONTROL2 está enviando eventos corretamente
3. Verifique se não há múltiplos handlers de MIDI

### Problema: O app não minimiza para bandeja
**Solução**:
1. Configure `MinimizeToTray = true` em hotkey_config.json
2. Verifique em `Show-MainFormTopmost` se está maximizando corretamente

### Problema: MinimizeRestoreToggle não funciona em botão customizado
**Solução**: 
1. Verifique se o botão está corretamente mapeado em `data/midi_config.json`
2. Confirme que o JSON está com sintaxe válida (sem vírgulas faltando)
3. Teste pressionando o botão - deve ver mensagem em debug: `"[MIDI] MinimizeRestore: Escondendo..."`
4. Se não aparecer, abra MIDI Config novamente e remapeie o botão
5. Verifique se a ação foi salva em `midi_config.json`

### Problema: MinimizeRestoreToggle funciona mas tem atraso
**Solução**:
1. O debounce de 800ms é intencional para evitar loop infinito
2. Se achar lento, pode reduzir para 500ms-600ms em `Dispatch-MidiAction`
3. Não reduza abaixo de 300ms - pode causar comportamento estranho

### Problema: Loop infinito - janela abre/fecha sozinha
**Solução**:
1. Verifique as funções `Hide-MainFormToTray` e `Show-MainFormTopmost`
2. Confirme que não há chamadas circulares entre elas
3. Se descobrir chamadas erradas, commente-as
4. Reinicie o app para testar

### Problema: Autoconexão mostra erro "Dispositivo não encontrado"
**Solução**:
1. Verifique se o nanoKONTROL2 está conectado ao USB
2. Verifique se os drivers do MIDI estão instalados
3. Abra Menu > MIDI > Conectar para ver lista de dispositivos disponíveis
4. Selecione o nanoKONTROL2 e conecte manualmente
5. Na próxima inicialização, deve conectar automaticamente

---

## �️ Segurança do Gadget - Como Restaurar Se Desaparecer

### O Problema:
Se você mexer na barra de opacidade do Gadget e deixá-la muito alta (causando invisibilidade), o Gadget pode desaparecer completamente da tela.

### A Solução - Sistema de 3 Estados:

O botão **GADGET** (e o mapeamento MIDI **ToggleGadget**) utiliza um sistema de ciclo com 3 estados:

**1º Clique**: Mostra o Gadget (visível)
**2º Clique**: Esconde o Gadget (desaparece)
**3º Clique**: Mostra o Gadget + Restaura opacidade para padrão (93%)

### Como Funciona:

1. **Clique 1 do botão GADGET** ou pressione botão MIDI mapeado:
   - Gadget fica visível e funcional
   - Você pode mexer na opacidade normalmente

2. **Clique 2 do botão GADGET** ou pressione botão MIDI novamente:
   - Gadget desaparece da tela
   - Timer é pausado para economizar recursos

3. **Clique 3 do botão GADGET** ou pressione botão MIDI novamente:
   - Gadget reaparece **COM opacidade restaurada para 93%**
   - Mesmo que você tenha deixado muito alta, volta ao padrão
   - Qualquer ajuste errado de opacidade é corrigido automaticamente

### Double-Click para Reset Rápido:

Alternativamente, você também pode **duplo-clicar na barra de opacidade** do Gadget para restaurá-la para 93% instantaneamente.

```
Gadget Opacidade Bar:
|████████░░░░░░| ← Double-click aqui para resetar para 93%
```

### Resumo de Controles:

| Ação | Efeito |
|------|--------|
| Clique 1 no GADGET | Mostra Gadget visível |
| Clique 2 no GADGET | Esconde Gadget |
| Clique 3 no GADGET | Mostra + Opacidade 93% |
| Double-Click na barra de opacidade | Reset para 93% |
| Mapeamento MIDI ToggleGadget | Ciclo de 3 estados via nanoKONTROL2 |

---

## �📞 Documentação Relacionada

- `data/midi_config.json` - Configuração MIDI salva
- `data/hotkey_config.json` - Configuração de hotkeys (incluso MinimizeToTray)
- `data/config.json` - Configuração geral do app

---

**Data de Implementação**: 21/03/2026  
**Versão**: ERP_GESTAO_REDUZIDA_EXTREME v2.0+  
**Status**: ✅ Produção
