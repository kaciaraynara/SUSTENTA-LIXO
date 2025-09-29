Arquitetura de Software do Sistema Sustenta CE


1. Descrição da Arquitetura
A arquitetura do Sustenta CE é baseada no padrão Cliente-Servidor (Client-Server), com uma abordagem modular. O sistema é dividido em três camadas lógicas que se comunicam via uma API RESTful.

Camada de Apresentação (Frontend): Responsável pela interação com o usuário. Terá duas interfaces: uma para o cidadão (mobile) e outra para o gestor (web).

Camada de Aplicação (Backend): Contém a lógica de negócio, processamento de dados e autenticação. Atua como o intermediário entre o frontend e o banco de dados.

Camada de Dados (Banco de Dados): Armazenamento e gerenciamento persistente das informações.

2. Diagrama de Arquitetura
O diagrama abaixo ilustra a comunicação entre as diferentes camadas da arquitetura do sistema.

graph TD
    subgraph "Camada de Apresentação"
        A[Aplicativo Mobile Cidadão] --> B(API RESTful);
        C[Painel Web Gestor] --> B;
    end

    subgraph "Camada de Aplicação (Backend)"
        B --> D{Lógica de Negócio e Serviços};
        D --> E[Autenticação de Usuários];
        D --> F[Serviços de Mapeamento];
        D --> G[Serviços de Notificação];
    end

    subgraph "Camada de Dados"
        D --> H[Banco de Dados PostgreSQL];
    end

3. Padrões Arquiteturais Utilizados
Padrão Cliente-Servidor: A arquitetura se baseia na separação entre cliente (frontend) e servidor (backend), permitindo o desenvolvimento independente das partes.

Padrão MVC (Model-View-Controller): Será aplicado no backend para separar a lógica de negócio (Model), a interface de dados (Controller) e a apresentação (simulada pelo frontend).

Arquitetura RESTful: A API de comunicação entre o frontend e o backend seguirá os princípios REST, utilizando endpoints claros e métodos HTTP padrão.

4. Decisões Técnicas e Justificativas
Componente

Tecnologia

Justificativa

Mobile

React Native

Multiplataforma: Um único código para iOS e Android. Performance: Rápido e com uma boa experiência de usuário. Comunidade: Grande comunidade e ecossistema de bibliotecas.

Web

ReactJS

Ecossistema unificado: Mesma lógica do React Native, facilitando a troca de desenvolvedores entre as equipes. Componentização: Facilita a reutilização de código e a manutenção.

Backend

Node.js (Express.js)

JavaScript: Permite que a mesma linguagem seja usada no frontend e backend. Assíncrono: Ideal para lidar com muitas requisições simultâneas (I/O non-blocking).

Banco de Dados

PostgreSQL

Relacional: Oferece consistência e integridade dos dados, essencial para a gestão de informações sobre o lixo e equipes. Geo-enabled: Possui a extensão PostGIS, ideal para trabalhar com dados de geolocalização.

Serviços de Mapeamento

Google Maps API

Precisão: Alta precisão de geolocalização. Features: Ricos recursos de personalização e marcação de pontos no mapa.

Autenticação

JWT (JSON Web Tokens)

Leveza: Não necessita de estado no servidor, o que torna a API mais escalável. Segurança: Utiliza criptografia para garantir a integridade dos tokens.