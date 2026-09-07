# Decisões de Arquitectura — n8n Reconciliation Engine

| Data | Decisão | Motivo | Fonte |
|---|---|---|---|
| 2026-03-27 | Matching em JavaScript nativo (Code node) em vez de serviço Python separado | Elimina dependência de servidor externo; n8n já em uso pelo cliente; latência menor | Análise de stack disponível |
| 2026-03-27 | 5 níveis de matching por ordem decrescente de confiança | Dados reais de produção mostraram que nomes de fornecedores diferem entre portais; um único critério deixaria 40%+ sem match | Teste com exportações reais |
| 2026-03-27 | Output dual: Excel + Email HTML em simultâneo | Equipa financeira usa Excel; gestores preferem resumo por email; os dois correm na mesma execução sem custo extra | Requisito do cliente |
| 2026-03-27 | Normalização antes do matching: maiúsculas, sem acentos, sem prefixos/sufixos legais (LDA, SA, FAC, FAT, FR) | Fornecedores registados de forma diferente no portal AT e no ERP causavam falsos negativos no L1 | Análise de dados reais: 15% dos fornecedores tinham variantes |
| 2026-03-27 | Histórico de corridas gravado sempre, incluindo testes | Permite auditar evoluções de match rate ao longo do tempo; requisito de rastreabilidade | Boas práticas de auditoria financeira |
| 2026-05-25 | Nível 5 (nome + valor, sem doc#) adicionado como fallback | Descoberto em produção: Emma Matratzen usa numeração de documento diferente entre portal e ERP; L4 não apanhava | Corrida de produção mai/2026 |
