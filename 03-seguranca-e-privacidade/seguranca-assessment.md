# Segurança — n8n Reconciliation Engine

## Lethal Trifecta

| Vértice | Presente? | Mitigação |
|---|---|---|
| Acesso a dados privados | Sim — faturas com valores e fornecedores | Dados processados in-memory; apenas resumos gravados no DB |
| Exposição a conteúdo não confiável | Não — inputs são exportações internas | N/A |
| Escrita/comunicação externa | Sim — email de relatório | Destinatários fixos em variável de ambiente; sem input do utilizador |

**Veredicto: ISOLADO** — um vértice presente (dados privados) com mitigação; sem superfície de ataque externa.

## Dados em trânsito

- Exportações do portal fiscal e ERP carregadas manualmente ou via API interna
- Valores monetários e nomes de fornecedores processados apenas em memória durante a corrida
- Output: totais e contagens por categoria (sem nomes de fornecedores individuais no email)
- Base de dados: histórico de contagens por corrida; sem PII de clientes finais

## Credenciais

- SMTP: variável de ambiente `SMTP_*` — nunca em código
- DB: variável de ambiente `DATABASE_URL` — nunca em código
- Credenciais n8n: sistema nativo de credentials do n8n

## O que fica em aberto

- Acesso ao n8n depende da segurança da instância (autenticação básica ou SSO — configuração do operador)
- Exportações de input chegam por upload manual — sem validação de schema no workflow atual
