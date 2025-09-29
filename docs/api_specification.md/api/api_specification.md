Especificação da API RESTful do Sustenta CE


1. Endpoints Previstos
A API do Sustenta CE segue o padrão RESTful e utiliza endpoints descritivos para gerenciar os dados.

Método

Endpoint

Descrição

POST

/api/auth/register

Cria um novo usuário (cidadão).

POST

/api/auth/login

Autentica um usuário e retorna um JWT.

POST

/api/relatos

Cria um novo relato de lixo. Requer autenticação.

GET

/api/relatos

Retorna uma lista de todos os relatos. Pode ser filtrado por status ou localização.

GET

/api/relatos/{id}

Retorna os detalhes de um relato específico.

PUT

/api/relatos/{id}

Atualiza um relato (apenas para gestores). Requer autenticação de gestor.

POST

/api/equipes

Cria uma nova equipe de coleta (apenas para gestores). Requer autenticação de gestor.

GET

/api/equipes

Retorna uma lista de todas as equipes de coleta.

GET

/api/relatos/meus

Retorna a lista de relatos feitos pelo usuário autenticado.

2. Parâmetros de Requisição e Resposta
POST /api/auth/register

Requisição (Body): {"nome": "João", "email": "joao@email.com", "senha": "uma_senha_forte"}

Resposta (Body): {"mensagem": "Usuário criado com sucesso!"}

POST /api/auth/login

Requisição (Body): {"email": "joao@email.com", "senha": "uma_senha_forte"}

Resposta (Body): {"token": "eyJhbGciOiJIUzI1NiIsInR5c..."}, "usuario": {"id": 1, "nome": "João"}}

POST /api/relatos

Requisição (Body): {"latitude": -3.7319, "longitude": -38.5267, "descricao": "Lixo em frente a escola", "foto": "url_da_foto.jpg"}

Resposta (Body): {"mensagem": "Relato enviado com sucesso!", "relato_id": 123}

PUT /api/relatos/{id}

Requisição (Body): {"status": "Em Andamento", "equipe_id": 1}

Resposta (Body): {"mensagem": "Relato atualizado com sucesso."}

3. Autenticação e Autorização
A autenticação será feita via JWT (JSON Web Tokens).

Após o login, o servidor emitirá um token.

Esse token deverá ser incluído no cabeçalho Authorization de todas as requisições que exigem autenticação, no formato Bearer <token>.

4. Exemplos de Chamadas (cURL)
Login de usuário:

curl -X POST -H "Content-Type: application/json" -d '{"email":"gestor@prefeitura.ce.gov.br", "senha":"uma_senha_forte"}' [http://api.sustentace.com.br/api/auth/login](http://api.sustentace.com.br/api/auth/login)

Criar um novo relato (com autenticação):

curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer <seu_token_jwt>" -d '{"latitude":-3.72, "longitude":-38.53, "descricao":"Lixo na calçada", "foto":"url_da_foto.jpg"}' [http://api.sustentace.com.br/api/relatos](http://api.sustentace.com.br/api/relatos)
