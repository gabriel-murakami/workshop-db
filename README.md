# workshop-db

## Visão Geral

Este repositório é responsável por **provisionar o banco de dados PostgreSQL** utilizado pela aplicação principal.

O banco é executado dentro do cluster Kubernetes, de forma isolada e controlada.

---

## Responsabilidades

- Provisionar PostgreSQL
- Gerenciar credenciais via Secrets
- Expor o banco internamente no cluster
- Garantir persistência de dados

---

## Componentes Kubernetes

- Deployment
- Service
- Persistent Volume
- Persistent Volume Claim
- Secrets

---

## Tecnologias Utilizadas

- PostgreSQL
- Kubernetes
- Terraform
- Docker

---

## Segurança

- Credenciais armazenadas em Kubernetes Secrets
- Banco exposto apenas via ClusterIP
- Acesso restrito à aplicação Rails

---

## Persistência

- Utiliza volume persistente
- Dados sobrevivem a reinícios de pods

---

## Observações Importantes

- Nenhuma aplicação externa deve acessar diretamente este banco
- Toda comunicação deve passar pela API Rails
- Este repositório deve ser aplicado antes do deploy da aplicação
