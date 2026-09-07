# Snapshot de Código

> Gerado a partir do commit `main` — regenerar com `git archive HEAD | tar -t`

## Estrutura

```
n8n-reconciliation-engine/
├── README.md
├── plan.md
├── output.md
├── examples/
│   └── (ficheiros de exemplo para demo)
├── scripts/
│   ├── schema.sql          ← schema PostgreSQL
│   └── normalize.py        ← normalização standalone para debug
└── workflow/
    └── reconciliation-engine.json   ← workflow n8n importável
```

## Como regenerar

```bash
git archive HEAD --format=tar | tar -t
```

## Nota

Código de cliente e dados reais de produção omitidos deste repositório público.
Implementação de referência completa disponível a pedido.
