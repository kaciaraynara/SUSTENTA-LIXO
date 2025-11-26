Documentação da API Implementada - SUSTENTA CE (N708)

Esta documentação reflete as rotas de persistência de dados (simuladas via Firestore) para o sistema Sustenta CE, conforme a implementação da Etapa 2.

1. Padrão de Comunicação

O sistema utiliza a biblioteca Firebase para simular a comunicação com o backend e o banco de dados.

2. Endpoints e Funções Implementadas

Função (Endpoint)

Componente (Coleção Firestore)

Descrição

POST /api/auth/login

signInWithCustomToken(auth, __initial_auth_token)

Autentica o usuário automaticamente via token do Canvas.

POST /api/relatos

addDoc(collection(db, relatos))

Cria um novo documento (relato) na coleção relatos (dados públicos).

GET /api/relatos

onSnapshot(collection(db, relatos))

Retorna todos os relatos para o Painel Gestor (acesso total).

GET /api/relatos/meus

query(collection(db, relatos), where('userId', '==', currentUserId))

Retorna apenas os relatos feitos pelo usuário autenticado (Histórico).

PUT /api/relatos/{id}

updateDoc(doc(db, relatos, id))

Atualiza o status de um relato específico (usado pelo Painel Gestor).

3. Modelo de Dados (Firestore)

O modelo de dados implementado segue a estrutura NoSQL no Firestore:

Campo

Tipo

Descrição

descricao

String

Detalhe do problema.

latitude

Number

Coordenada geográfica.

longitude

Number

Coordenada geográfica.

status

String

('Pendente', 'Em Andamento', 'Concluído').

timestamp

Timestamp

Data e hora da criação.

userId

String

ID do usuário que criou o relato.