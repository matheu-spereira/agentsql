# Agente SQL com n8n, LLM, OpenWebUI e PostgreSQL

Este projeto implementa um agente inteligente capaz de responder perguntas em linguagem natural sobre um banco de dados PostgreSQL local, convertendo-as dinamicamente em consultas SQL. Ele integra ferramentas de automação, execução de modelos de linguagem (LLMs) locais ou em nuvem, e uma interface conversacional intuitiva.

## Tecnologias Utilizadas

- **[n8n](https://n8n.io/):** Plataforma de automação de fluxos de trabalho que coordena a comunicação entre os serviços.
- **[LLM (Large Language Model):** Pode ser executado localmente via [Ollama](https://ollama.com/) ou acessado como serviço via [Azure OpenAI Service](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/overview) ou outros.
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
Modelo LLM (Ollama, Azure OpenAI ou outros..)
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

Crie um workflow importando o arquivo [`/workflow/SQL_AGENT.json`](./workflow/SQL_AGENT.json), que já contém o fluxo previamente configurado. Em seguida, clique em "Import from File".

![alt text](/assets/n8n.gif)

Crie as credenciais de acesso ao PostgreSQL e defina o banco de dados onde estão localizadas as tabelas que serão utilizadas.
![alt text](/assets/n8n_postgres1.gif)

Crie as credenciais de acesso ao PostgreSQL e defina o banco de dados onde as interações serão salvas.
![alt text](/assets/n8n_postgresn8n.gif)

Caso utilize um modelo do Ollama, crie uma credencial de acesso ao serviço Ollama e selecione o modelo que já está instalado localmente.
![alt text](/assets/ollama.gif)

Caso não utilize o Ollama, configure o workflow com o modelo de linguagem por meio do serviço que preferir.
Por fim, salve e ative o workflow.
![alt text](/assets/image-1.png)


## Configurando o Open WebUI
Primeiro, crie uma nova função. Para isso, acesse o painel de administração e vá até a aba "Funções".

Link: http://localhost:3000/admin/functions

Em seguida, crie e nomeie uma nova função, colando nela o conteúdo do arquivo [`/functions/function_openwebui`](./functions/function_openwebui)
![alt text](/assets/n8n_pipe.gif)

Agora, habilite a função e insira a URL de produção do Webhook gerado no workflow.
![alt text](/assets/configure_n8npipe.gif)



Pronto! Agora é possível interagir com o banco de dados diretamente pelo Open WebUI.
Para usar, basta fazer uma pergunta sobre os seus dados!

![alt text](/assets/agentsql.gif)