# Mapa do Dossier — n8n Reconciliation Engine

> Lê este ficheiro primeiro. Cada pasta tem um propósito.

| Pasta / Ficheiro | O que contém | Quando ler |
|---|---|---|
| `README.md` | Visão geral pública: problema, solução, resultados, stack, setup | Primeira vez que chegares ao repo |
| `plan.md` | Objectivo, critérios de sucesso, estado actual com métricas reais | Para perceber o que foi feito e o que ficou pendente |
| `output.md` | Registo cronológico de decisões e corridas de produção | Para perceber *porquê* algo foi feito de determinada forma |
| `01-planeamento/` | Plano estratégico congelado (scope, decisões fechadas, arquitectura) | Para perceber as decisões de design originais |
| `02-arquitectura/` | Arquitectura real com diagramas mermaid | Para entender o sistema antes de tocar no código |
| `03-seguranca-e-privacidade/` | Assessment de segurança: Lethal Trifecta, dados em trânsito | Para auditoria ou antes de alterar o tratamento de dados |
| `04-observabilidade/` | O que é monitorizado e como | Para ops e on-call |
| `05-autenticacao/` | Controlo de acesso (N/A neste caso) | N/A — sistema interno |
| `06-avaliacao-baterias/` | Histórico de corridas de produção com métricas | Para acompanhar evolução do match rate |
| `07-deploy-e-operacao/` | Runbook: como deployar, comandos do dia a dia, incidentes | Para quem vai fazer redeploy ou resolver um incidente |
| `08-cliente-e-demo/` | Guião cronometrado de demo | Para preparar uma apresentação |
| `09-decisoes-e-licoes/` | Todas as decisões de arquitectura datadas com fonte | Para perceber "porque é que está assim?" |
| `codigo/` | Snapshot da estrutura de ficheiros | Para orientação rápida no código |
