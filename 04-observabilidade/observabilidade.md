# Observabilidade — n8n Reconciliation Engine

## Aplicabilidade

Este workflow corre uma vez por mês (ou sob pedido manual). Não tem utilizadores em tempo real nem tráfego contínuo.

**Observabilidade aplicada:** logs de execução do n8n + histórico de corridas em PostgreSQL.

## O que é monitorizado

| Evento | Onde | Como verificar |
|---|---|---|
| Corrida iniciada | n8n Execution log | n8n UI → Executions |
| Total de registos processados | PostgreSQL `reconciliation_runs` | `SELECT * FROM reconciliation_runs ORDER BY run_date DESC` |
| Match rate por nível | PostgreSQL | Tabela `reconciliation_runs.level_breakdown` |
| Email enviado | n8n Execution log | Nó SMTP — status OK/ERRO |
| Erros de parsing | n8n Execution log | Nó de normalização — output de erro |

## O que mudaria para aplicar observabilidade completa

Se este workflow passar a correr diariamente ou em tempo real, adicionar:
- Span OTel por execução (tempo de normalização, tempo de matching, tempo de geração)
- Alerta automático se match rate cair abaixo de 70%
- Dashboard com evolução histórica do match rate
