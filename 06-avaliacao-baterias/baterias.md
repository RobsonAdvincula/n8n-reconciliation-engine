# Avaliação — n8n Reconciliation Engine

## Não aplicável (workflow determinístico)

Este sistema não usa LLM para tomar decisões — o matching é determinístico (JavaScript com regras fixas). Não há variância de modelo nem baterias de personas.

**Avaliação usada:** corridas de produção com dados reais, comparando output com revisão humana manual nos primeiros 2 meses.

| Corrida | Data | Registos | Match auto | Revisão humana |
|---|---|---|---|---|
| Produção 1 | 2026-04 | ~600 | ~75% | ~25% |
| Produção 2 | 2026-05-25 | 607+703 | ~78% | ~22% |

**O que mudaria para aplicar baterias:** se for adicionado um componente LLM para matching semântico de nomes de fornecedores, aplicar bateria de 30+ casos com gate de precisão ≥ 95% antes de produção.
