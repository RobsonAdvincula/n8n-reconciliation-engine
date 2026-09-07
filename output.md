# Output: Motor de Reconciliação — Registo Cronológico

## Sessão inicial · 2026-03-27

| Entrega | Estado | Prova |
|---|---|---|
| Algoritmo 5 níveis | feito | Code node n8n funcional |
| Normalização | feito | Testes com dados reais |
| Relatório Excel | feito | 4 folhas geradas |
| Email HTML | feito | Enviado e validado |

### Decisões tomadas
- Escolhido JavaScript nativo no Code node em vez de Python externo — elimina dependência de servidor externo e mantém tudo dentro do n8n.
- Nível 5 (nome + valor) adicionado após testes com dados reais revelarem fornecedores com numeração inconsistente entre portais.

## Corrida de produção · 2026-05-25

| Métrica | Valor |
|---|---|
| Registos portal fiscal | 607 |
| Registos ERP | 703 |
| Match exacto (L1) | 149 (24.5%) |
| Match provável (L2-L5) | 325 (53.5%) |
| Divergência de valor | 3 (0.5%) |
| Em falta no ERP | 124 |
| Em falta no portal | 230 |
| Cancelados | 6 |

### Desvios face ao plano
- Emma Matratzen com numeração diferente entre sistemas — identificada como caso especial, pendente configuração de regra específica no L4.
