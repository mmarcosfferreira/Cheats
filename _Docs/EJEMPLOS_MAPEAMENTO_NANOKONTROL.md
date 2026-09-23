# Exemplos de Mapeamento MinimizeRestoreToggle

Aqui estão algumas configurações práticas para mapear MinimizeRestoreToggle em diferentes botões do nanoKONTROL2.

## Exemplo 1: Usar botão M1 para Minimizar/Restaurar

### Via Formulário MIDI (Recomendado):
1. Abra Menu > MIDI > Editar Mapeamento
2. Procure seção "Sistema" (vermelho)
3. Clique em "MinimizeRestoreToggle"
4. Pressione o botão **M1** (primeiro botão dos controles de canal)
5. ✓ Pronto!

### Via JSON Direto:
Abra `data/midi_config.json` e adicione:
```json
{
  "DeviceId": 0,
  "Map": {
    "48": "MinimizeRestoreToggle"  // M1 = ID 48
  }
}
```

### Teste:
- Pressione M1 → Janela minimiza
- Espere 800ms e pressione M1 novamente → Janela restaura

---

## Exemplo 2: Usar botão Vazio (62) para Minimizar/Restaurar

**Vantagem**: O botão 62 está vazio (sem função padrão), então não quebra nada!

### Via Formulário:
1. Menu > MIDI > Editar Mapeamento
2. Procure "Sistema" > "MinimizeRestoreToggle"
3. Pressione o botão **>> Marker** (segundo botão após "SET")
4. ✓ Pronto!

### Via JSON:
```json
{
  "Map": {
    "62": "MinimizeRestoreToggle"  // >> Marker = ID 62
  }
}
```

---

## Exemplo 3: Comparar com Mapeamento Padrão

### Padrão (SET button):
```json
{
  "Map": {
    "60": "MinimizeRestoreToggle"  // SET
  }
}
```

### Alternativo (Todos vazios):
```json
{
  "Map": {
    "59": "MinimizeRestoreToggle",  // >>| Track Next
    "61": "ToggleWindow",           // << Marker
    "62": "ToggleFavMode"           // >> Marker
  }
}
```

---

## Exemplo 4: Combinação Completa (Recommend Adv.)

Se quiser um mapeamento mais completo:

```json
{
  "DeviceId": 0,
  "Map": {
    "41": "PlayPause",
    "42": "Stop",
    "43": "PrevTrack",
    "44": "NextTrack",
    "45": "ToggleShuffle",
    "46": "ToggleRepeat",
    "48": "VolDown",
    "49": "VolUp",
    "50": "ToggleMute",
    "51": "ToggleShuffle",
    "52": "ToggleRepeat",
    "53": "ToggleSearchPlaylist",
    "54": "PrevTrack",
    "55": "NextTrack",
    "58": "PrevTrack",
    "59": "NextTrack",
    "60": "MinimizeRestoreToggle",  // ← SET button para minimizar
    "61": "ToggleWindow",           // ← << Marker como alternativa
    "62": "(nenhum)"
  }
}
```

---

## Tabela de Referência Rápida

| ID | Botão | Sugestão |
|----|-------|----------|
| **41** | PLAY | PlayPause (padrão) |
| **42** | STOP | Stop (padrão) |
| **43** | REWIND | PrevTrack (padrão) |
| **44** | FORWARD | NextTrack (padrão) |
| **45** | RECORD | ToggleShuffle (padrão) |
| **46** | CYCLE | ToggleRepeat (padrão) |
| **48-55** | M1-M8 | Customize! |
| **58** | \|\<< | Pode mapear MinimizeRestore |
| **59** | >>\| | Pode mapear MinimizeRestore |
| **60** | SET | **MinimizeRestoreToggle** (padrão) |
| **61** | << Marker | Vazio (ótimo para MinimizeRestore!) |
| **62** | >> Marker | Vazio (ótimo para MinimizeRestore!) |

---

## Problemas Comuns ao Mapear

### Problema: JSON não valida
**Solução**: Use um validador JSON online ou confirme que:
- Não há vírgulas faltando
- Strings estão entre aspas
- Não há trailing commas

**Exemplo errado:**
```json
{ "60": "MinimizeRestoreToggle", }  // ❌ trailing comma!
```

**Exemplo correto:**
```json
{ "60": "MinimizeRestoreToggle" }   // ✓ sem comma ao final
```

### Problema: Mapeamento foi feito mas não funciona
1. Reinicie o app (para recarregar o JSON)
2. Verifique se o ID do botão está correto
3. Teste pressionando o botão - procure por mensagens de log

### Problema: Quero restaurar o padrão
Simplesmente remova a entrada customizada:

**Antes:**
```json
{ "60": "MyCustomAction" }
```

**Depois (padrão voltado):**
```json
{ }
```

Ou simplesmente delete `data/midi_config.json` e reconecte!

---

## 🎯 Referências

- **IDs de botões**: Use a tabela acima
- **Nomes de ações**: Veja em Menu > MIDI > Editar Mapeamento
- **Documentação**: CONFIGURACAO_NANOKONTROL_MIDI.md

---

**Importante**: Depois de editar `midi_config.json` manualmente:
1. **Salve o arquivo**
2. **Reinicie o app** ERP_GESTAO_REDUZIDA_EXTREME
3. **Teste pressionando o botão**

Se não funcionar, abra Menu > MIDI > Editar Mapeamento novamente para verificar!

---

## 🔧 Bônus: Controlando o Gadget via MIDI

### O que é o Gadget?
O Gadget é um painel flutuante que mostra informações simples e pode ser controlado via MIDI ou teclado.

### Exemplo: Mapear ToggleGadget em um botão

**Via Formulário MIDI:**
1. Menu > MIDI > Editar Mapeamento
2. Procure seção "Sistema" > "ToggleGadget"
3. Pressione um botão vazio do nanoKONTROL2 (ex: M3, M4, etc.)
4. Gadget agora pode ser toggled (show/hide) via MIDI!

**Via JSON:**
```json
{
  "Map": {
    "51": "ToggleGadget"  // M3 = ID 51
  }
}
```

### Atalho de Segurança - Sistema de 3 Cliques:

O ToggleGadget funciona com um sistema inteligente de 3 cliques:

1. **Clique 1**: Mostra o Gadget (visível)
2. **Clique 2**: Esconde o Gadget (desaparece da tela)
3. **Clique 3**: Mostra o Gadget + Restaura opacidade para padrão (93%)

Isso garante que mesmo se você deixar a opacidade alta demais acidentalmente:
- **Clique 2** para esconder
- **Clique 3** para trazer com opacidade padrão restaurada!

### Exemplo Completo com Gadget:
```json
{
  "DeviceId": 0,
  "Map": {
    "41": "PlayPause",
    "42": "Stop",
    "43": "PrevTrack",
    "44": "NextTrack",
    "45": "ToggleShuffle",
    "46": "ToggleRepeat",
    "60": "MinimizeRestoreToggle",  // SET → minimiza/restaura janela
    "51": "ToggleGadget"             // M3 → mostra/esconde Gadget
  }
}
```

---

## 🎯 Referências

- **IDs de botões**: Use a tabela acima
- **Nomes de ações**: Veja em Menu > MIDI > Editar Mapeamento
- **Documentação completa**: CONFIGURACAO_NANOKONTROL_MIDI.md
