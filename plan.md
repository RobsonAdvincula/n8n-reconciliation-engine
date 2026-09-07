# Plan: Motor de Reconciliação de Faturas — n8n

> Criado: 2026-03-27 · Stack: n8n + PostgreSQL + Python · Em produção

## Objectivo

Eliminar o processo manual mensal de comparação de faturas entre o portal fiscal (AT/e-Fatura) e o ERP — automatizando a classificação, o relatório e o envio por email.

## Critério de sucesso

| Nível | Métrica | Alvo |
|---|---|---|
| Primária | Taxa de match automático | ≥ 75% das faturas sem intervenção |
| Guarda | Tempo de reconciliação | < 1h/mês (vs 2-3 dias manuais) |
| Exactidão | Falsos positivos no match | < 1% |

## Decisões fechadas

| Decisão | Escolha |
|---|---|
| Orquestração | n8n (auto-hospedado) — já em uso pelo cliente |
| Matching | 5 níveis em JavaScript (Code node) — sem dependência externa |
| Output | Excel 4 folhas + email HTML — formatos já usados pela equipa |
| Storage | PostgreSQL/Supabase — histórico de todas as corridas |

## Estado a 2026-05-25

| Medida | Valor | Prova |
|---|---|---|
| Documentos processados/mês | 600–700 | Logs n8n |
| Match automático | ~78% | Relatório Excel |
| Tempo de reconciliação | ~40 min/mês | vs 2-3 dias antes |
| Itens para revisão humana | < 5% | Relatório Excel |

## Por dia do plano

| Fase | Estado | Notas |
|---|---|---|
| Algoritmo 5 níveis | ✅ Concluído | Levels 1-5 implementados e testados |
| Normalização de nomes/docs | ✅ Concluído | Acentos, prefixos, sufixos legais |
| Relatório Excel (4 folhas) | ✅ Concluído | Summary + Matched + Review + Unmatched |
| Email HTML color-coded | ✅ Concluído | Enviado automaticamente após cada corrida |
| Agendamento mensal | ✅ Concluído | Cron trigger n8n |
