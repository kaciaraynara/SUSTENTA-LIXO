Modelo de Dados do Sistema Sustenta CE


1. Modelo de Entidade-Relacionamento (ER)
O diagrama abaixo representa as principais entidades e seus relacionamentos.

erDiagram
    USUARIO {
        INT id PK
        VARCHAR nome
        VARCHAR email
        VARCHAR senha
        VARCHAR tipo "Cidadao/Gestor"
        TIMESTAMPTZ criado_em
    }
    RELATO {
        INT id PK
        VARCHAR status "Aberto, Em Andamento, Resolvido"
        VARCHAR descricao
        VARCHAR foto_url
        GEOMETRY geolocalizacao
        TIMESTAMPTZ criado_em
        INT usuario_id FK
        INT equipe_id FK
    }
    EQUIPE {
        INT id PK
        VARCHAR nome
        VARCHAR responsavel
        TIMESTAMPTZ criado_em
    }
    RELATO ||--o{ USUARIO : "relatado por"
    RELATO ||--o{ EQUIPE : "atribuído a"


2. Descrição das Entidades e Relacionamentos
USUARIO: Representa tanto o cidadão que faz um relato quanto o gestor que gerencia as ocorrências. A distinção é feita pelo campo tipo.

RELATO: A entidade principal do sistema. Contém todas as informações sobre uma ocorrência de lixo. É relacionada a um USUARIO que a criou e a uma EQUIPE que pode ser atribuída para resolvê-la.

EQUIPE: Representa as equipes de coleta da prefeitura.


3. Dicionário de Dados
Tabela USUARIO
Campo

Tipo

Descrição

Restrições

id

INT

Identificador único do usuário.

Chave Primária, Auto-incremento

nome

VARCHAR(255)

Nome completo do usuário.

Não nulo

email

VARCHAR(255)

E-mail para login.

Único, Não nulo

senha

VARCHAR(255)

Senha criptografada.

Não nulo

tipo

VARCHAR(50)

Tipo de usuário: cidadao ou gestor.

Não nulo

criado_em

TIMESTAMPTZ

Data e hora da criação do registro.

Não nulo, Padrão: NOW()

Tabela RELATO
Campo

Tipo

Descrição

Restrições

id

INT

Identificador único do relato.

Chave Primária, Auto-incremento

status

VARCHAR(50)

Status da ocorrência: aberto, em andamento ou resolvido.

Não nulo, Padrão: aberto

descricao

TEXT

Descrição detalhada do problema.

Opcional

foto_url

VARCHAR(255)

URL da imagem do lixo.

Não nulo

geolocalizacao

GEOMETRY

Ponto geográfico (latitude, longitude) do relato.

Não nulo

criado_em

TIMESTAMPTZ

Data e hora da criação do relato.

Não nulo, Padrão: NOW()

usuario_id

INT

Chave estrangeira para a tabela USUARIO.

Chave Estrangeira

equipe_id

INT

Chave estrangeira para a tabela EQUIPE.

Opcional, Chave Estrangeira

Tabela EQUIPE
Campo

Tipo

Descrição

Restrições

id

INT

Identificador único da equipe.

Chave Primária, Auto-incremento

nome

VARCHAR(255)

Nome da equipe (ex: "Equipe Centro").

Não nulo, Único

responsavel

VARCHAR(255)

Nome do responsável pela equipe.

Opcional

criado_em

TIMESTAMPTZ

Data e hora da criação do registro.

Não nulo, Padrão: NOW()