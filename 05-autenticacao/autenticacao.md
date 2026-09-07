# Autenticação — n8n Reconciliation Engine

## Não aplicável (sistema interno)

Este workflow não tem utilizadores externos nem interface pública. O acesso é controlado pela instância n8n.

**Autenticação da instância n8n:** configurada pelo operador (básica, SSO ou LDAP dependendo da instalação).

**O que mudaria para aplicar:** se o workflow expuser um webhook público para trigger manual, adicionar verificação de token Bearer no nó de entrada.
