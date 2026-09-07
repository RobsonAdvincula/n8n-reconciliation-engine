# Plano Estratégico — n8n Reconciliation Engine

> 2026-03-27 · CONGELADO

## Objectivo e critério de sucesso

Automatizar a reconciliação mensal de faturas entre o portal fiscal (AT/e-Fatura) e o ERP da empresa, eliminando 2-3 dias de trabalho manual por mês.

**Gate de sucesso:** ≥ 75% das faturas classificadas automaticamente sem intervenção humana.

## Decisões fechadas

| Decisão | Escolha | Nota |
|---|---|---|
| Orquestrador | n8n self-hosted | Já em uso; sem nova infraestrutura |
| Matching | 5 níveis JS no Code node | Sem dependências externas |
| Output | Excel 4 folhas + email HTML | Formatos já usados pela equipa |
| Storage | PostgreSQL/Supabase | Histórico auditável |
| Agendamento | Cron mensal | Possível trigger manual por webhook |

## Arquitectura (decisão de 2026-03-27)

```
Portal Fiscal (CSV) ──┐
                      ├─► n8n ─► Normalização ─► Match 5 Níveis ─► Excel + Email + DB
ERP (CSV/API) ────────┘
```

## Fronteiras

- Código de cliente omitido do repositório público
- Credenciais nunca em código — apenas variáveis de ambiente
- Dados de fornecedores não expostos no output público
