# Demo — n8n Reconciliation Engine

## Guião (15 minutos)

### Enquadramento (2 min)
"A equipa financeira passava 2-3 dias por mês a comparar faturas manualmente. Hoje o mesmo processo corre em 40 minutos, sem intervenção."

### Bloco 1 — Input (3 min)
- Mostrar exportação CSV do portal fiscal (e-Fatura/AT)
- Mostrar exportação CSV do ERP
- Activar workflow manualmente via webhook

### Bloco 2 — Processamento (2 min)
- Mostrar execução ao vivo no n8n (Executions tab)
- Explicar os 5 níveis de matching enquanto corre

### Bloco 3 — Output (5 min)
- Abrir relatório Excel gerado automaticamente
  - Folha Summary: totais por categoria
  - Folha Matched: matches confirmados
  - Folha Review Required: os ~5% que precisam de revisão humana
  - Folha Unmatched: o que falta em cada sistema
- Mostrar email HTML recebido com resumo color-coded

### Bloco 4 — Pergunta que fecha (3 min)
"Quantas faturas processa a vossa equipa por mês? Com este volume, quanto tempo pouparia?"

## Plano B

Se o n8n não estiver acessível durante a demo: mostrar relatório Excel pré-gerado + screenshot da execução.

## Checklist antes da demo

- [ ] n8n activo e acessível
- [ ] Ficheiros de exemplo em `examples/` carregados
- [ ] Credenciais SMTP e PostgreSQL configuradas
- [ ] Corrida de teste feita nas 24h anteriores com sucesso
