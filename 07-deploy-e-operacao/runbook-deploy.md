# Runbook — n8n Reconciliation Engine

## Topologia

```
n8n (self-hosted)
    └── Workflow: reconciliation-engine
         ├── Trigger: Cron (mensal) ou Webhook (manual)
         ├── Code nodes: normalização + matching (JS)
         ├── PostgreSQL: histórico de corridas
         └── SMTP: envio do relatório
```

## Pré-requisitos

| Componente | Versão mínima |
|---|---|
| n8n | 1.0+ |
| PostgreSQL | 13+ |
| Node.js | 18+ (para scripts Python auxiliares) |

## Variáveis de ambiente (nomes — nunca os valores aqui)

```
DATABASE_URL         # PostgreSQL connection string
SMTP_HOST            # Servidor SMTP
SMTP_PORT            # Porta SMTP
SMTP_USER            # Utilizador SMTP
SMTP_PASS            # Password SMTP
REPORT_EMAIL_TO      # Destinatário(s) do relatório
```

## Comandos do dia a dia

```bash
# Verificar se o workflow está activo
# n8n UI → Workflows → reconciliation-engine → estado "Active"

# Correr manualmente (webhook trigger)
curl -X POST https://your-n8n/webhook/reconciliation-trigger

# Verificar histórico de corridas
psql $DATABASE_URL -c "SELECT run_date, total_records, matched_count FROM reconciliation_runs ORDER BY run_date DESC LIMIT 10;"
```

## Procedimento de deploy

1. Clonar o repo
2. Importar `workflow/reconciliation-engine.json` no n8n
3. Configurar as credentials no n8n (PostgreSQL + SMTP)
4. Configurar variáveis de ambiente
5. Correr `scripts/schema.sql` na base de dados
6. Activar o workflow
7. Correr um teste manual com dados de amostra (`examples/`)

## Procedimento de incidente

**Corrida falha sem relatório:**
1. Verificar logs do workflow no n8n (Executions tab)
2. Verificar conectividade PostgreSQL
3. Verificar credenciais SMTP
4. Correr novamente manualmente

**Match rate abaixo do esperado:**
1. Verificar formato das exportações (encoding, separadores)
2. Correr normalização isolada em `scripts/normalize.py` com dados de amostra
3. Verificar se há novos prefixos de documentos não cobertos pelo L4
