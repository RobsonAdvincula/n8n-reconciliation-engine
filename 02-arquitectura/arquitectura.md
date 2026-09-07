# Arquitectura — n8n Reconciliation Engine

> Estado real em 2026-05-25 · Commit de referência: main

## Em uma imagem

```mermaid
flowchart TD
    A[📄 Exportação Portal Fiscal\nCSV/JSON] --> C[n8n Orchestrator]
    B[🏢 Exportação ERP\nCSV/API] --> C

    C --> D[Normalizar & Limpar\nnomes, prefixos, valores]
    D --> E{L1: Match Exacto?}

    E -->|Sim| F[✅ Match Exacto]
    E -->|Não| G{L2: Doc# + Valor?}
    G -->|Sim| H[🔶 Match Provável]
    G -->|Não| I{L3: Só Doc#?}
    I -->|Sim| J[⚠️ Valor Divergente]
    I -->|Não| K{L4: Sufixo + Valor?}
    K -->|Sim| L[🔶 Match Provável\nvariante de prefixo]
    K -->|Não| M{L5: Nome + Valor?}
    M -->|Sim| N[🔶 Match Provável\nfallback]
    M -->|Não| O[❌ Sem Match]

    F & H & J & L & N & O --> P[📊 Relatório Excel\n4 folhas]
    P --> Q[📧 Email HTML\nresumido por cor]
    P --> R[💾 PostgreSQL\nhistórico]
```

## Regra que organiza tudo

**Níveis de confiança decrescente, paragem no primeiro match.**
Cada nível afrouxa um critério de matching. O resultado de cada fatura é o nível mais alto (mais rigoroso) onde houve correspondência.

## Um ciclo do início ao fim

```mermaid
sequenceDiagram
    participant Cron as Cron Trigger (n8n)
    participant ETL as Normalização
    participant Engine as Motor 5 Níveis
    participant Report as Gerador Excel
    participant Mail as Email (SMTP)
    participant DB as PostgreSQL

    Cron->>ETL: Carrega exportações (portal + ERP)
    ETL->>Engine: Dados normalizados
    Engine->>Engine: L1 → L2 → L3 → L4 → L5
    Engine->>Report: Resultados classificados
    Report->>Mail: Excel + HTML
    Report->>DB: Registo histórico da corrida
```

## Decisões que não são negociáveis

1. **Matching em JavaScript nativo** — sem servidor Python externo; tudo corre dentro do n8n
2. **5 níveis sempre correm por ordem** — nunca saltar níveis, mesmo que L1 já resolva maioria
3. **Output sempre Excel + Email** — os dois em simultâneo; nunca só um
4. **Normalização antes do matching** — maiúsculas, sem acentos, sem prefixos/sufixos legais
5. **Histórico sempre gravado** — mesmo em corridas de teste
