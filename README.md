# Agente SQL com n8n, LLM (Ollama ou Azure), OpenWebUI e PostgreSQL

Este projeto implementa um agente inteligente capaz de responder perguntas em linguagem natural sobre um banco de dados PostgreSQL, convertendo-as dinamicamente em consultas SQL. Ele integra ferramentas de automação, execução de modelos de linguagem (LLMs) locais ou em nuvem, e uma interface conversacional intuitiva.

## Tecnologias Utilizadas

- **[n8n](https://n8n.io/):** Plataforma de automação de fluxos de trabalho que coordena a comunicação entre os serviços.
- **[LLM (Large Language Model):** Pode ser executado localmente via [Ollama](https://ollama.com/) ou acessado como serviço via [Azure OpenAI Service](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/overview).**
- **[OpenWebUI](https://github.com/open-webui/open-webui):** Interface web de chat que permite interagir com o modelo LLM de forma amigável.
- **[PostgreSQL](https://www.postgresql.org/):** Banco de dados relacional que serve como fonte de dados para as consultas.
- **[Docker](https://www.docker.com/):** Ferramenta de conteinerização usada para empacotar e executar os componentes do sistema.

## Arquitetura do Projeto

```text
Usuário
   │
   ▼
Interface de Chat (OpenWebUI)
   │
   ▼
n8n (Orquestração)
   │
   ▼
Modelo LLM (Ollama ou Azure OpenAI)
   │
   ▼
PostgreSQL (Base de Dados)
```



## Como Executar o Projeto
Pré-requisitos: Docker e Docker Compose instalados

```
git clone https://github.com/matheu-spereira/agentsql.git
cd agentsql
```

Se estiver usando Ollama, adicione um modelo LLM local. Exemplo:
```
ollama pull qwen2.5:14b
```
Suba os contêineres
```
docker-compose up --build -d
```

## Acesse as interfaces

n8n: http://localhost:5678

OpenWebUI: http://localhost:3000

PostgreSQL: porta 5432 (usuário e senha no .env)


## Criando Workflow no n8n
Acesse a interface do n8n

Crie um workflow e clique em "Import from File".
![alt text](/assets/image.png)

Crie as credenciais para o postgres.
![alt text](/assets/credential_postgres.png)

Por fim insira as credencias para o modelo do Azue OpenAI. Caso esteja utilizando um modelo do Ollama. Basta criar um novo modelo
