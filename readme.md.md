SUSTENTA CE: IMPLEMENTAÇÃO DO SISTEMA MULTIPLATAFORMA (N708)

Este repositório contém o código-fonte funcional do sistema Sustenta CE, desenvolvido para a Etapa 2 do Projeto Aplicado Multiplataforma, em alinhamento com o ODS 11 (Cidades e Comunidades Sustentáveis).

Resumo da Etapa 1 (Planejamento)

A Etapa 1 (N705) foi focada na Engenharia de Requisitos e Arquitetura, estabelecendo a base para este projeto de implementação:

Artefato

Detalhe

Finalidade

Requisitos (RFs e RNFs)

Documentação completa dos requisitos funcionais (Ex: Envio de Relato) e não-funcionais (Ex: Segurança, Performance).

Definiu o O QUE e o COMO do sistema.

Arquitetura

Definição da arquitetura de 3 Camadas (Frontend, Backend, Dados), escolhendo React Native e ReactJS para o Multiplataforma.

Garantiu a escalabilidade e a escolha tecnológica correta.

Modelo de Dados

Criação do Diagrama ER e Dicionário de Dados, com foco no uso de PostgreSQL/PostGIS para localização.

Estruturou o armazenamento de dados geoespaciais.

Protótipos

Criação de wireframes e protótipos navegáveis (Web e Mobile).

Validou a usabilidade inicial e o fluxo de usuário.

1. Funcionalidades Implementadas (Etapa 2)

O sistema foi implementado seguindo os requisitos da Etapa 1 e o foco na solução multiplataforma:

App Mobile (Cidadão): Criação de relatos com geolocalização e visualização do histórico.

Painel Web (Gestor): Visualização em tempo real de todos os relatos, filtragem por status e botões de Ação Rápida (Mudar Status).

Integração: Comunicação funcional e persistente entre o Frontend e o Backend (Firestore).

2. Tecnologias e Arquitetura

O projeto manteve a arquitetura MVC de três camadas definida na Etapa 1:

Componente

Tecnologia

Finalidade

Frontend

HTML, JavaScript, Tailwind CSS

Interface Mobile e Web Responsiva.

Backend

Node.js / Express (Simulado)

Roteamento e Lógica da API.

Banco de Dados (Persistência)

Firestore

Persistência de dados em tempo real e consultas em tempo real.

Testes

Python / Validações JS

Testes Unitários (Simulados) e de Validação.

3. INSTRUÇÕES CRÍTICAS DE ACESSO (SOLUÇÃO PARA O ERRO DE PERMISSÃO)

ATENÇÃO PROFESSOR: O Painel Gestor está gerando o erro "Permissão Negada" porque as regras de segurança padrão do Firebase bloqueiam a leitura de coleções públicas por qualquer usuário (mesmo autenticado).

Para que o Painel Gestor carregue a lista de relatos e os botões funcionem, por favor, realize a seguinte correção em seu ambiente Firebase:

Acesse o seu Console do Firebase (Firestore Database).

Vá para a aba "Regras" (Rules).

Publique as regras de segurança fornecidas no arquivo firestore-security-rules.md na raiz deste repositório.

Após aplicar as regras, o sistema funcionará perfeitamente.

App Mobile: Abrir o arquivo frontend/mobile/index.html em qualquer navegador.

Painel Gestor: Abrir o arquivo frontend/web/index.html em qualquer navegador.

4. Validação com Público-Alvo (Obrigatório)

O projeto foi validado para garantir que fosse útil e utilizável pelo público real (Morador/Cidadão).

Público Validado (Amostra): Ana Yara de Aquino (Bairro Quintino Cunha) e Luís Antônio Gomes Paiva (Bairro Edson Queiroz).

Principal Feedback: O botão de GPS no celular não dava feedback visual de carregamento.

Ajuste Implementado: Implementamos um indicador visual (animate-pulse e texto "Buscando GPS...") para melhorar a usabilidade em campo.

(O relatório completo da validação, o feedback e as evidências estão na pasta validation/.)

5. Estrutura do Repositório (Etapa 2)

A estrutura segue o padrão obrigatório do N708 para evitar penalidades:

SUSTENTA-LIXO/
├── README.md
├── docs/                      (Documentação da Etapa 1/Atualizada)
├── validation/                (Relatórios e Evidências da Validação)
├── frontend/                  (Código Front)
│   ├── mobile/
│   └── web/
├── backend/                   (Código Simulado do Servidor)
├── tests/                     (Testes Automatizados)
└── database/                  (Script SQL do Banco)


6. Equipe de Desenvolvimento

Membro

Papel

Jessica Barroso Campos

Gerente de Projeto

Ana Cristina Castelo Branco Rodrigues

Dev Frontend (Mobile)

Andressa de Oliveira Melo

Dev Frontend (Web)

Raynara Kácia Magalhães Fonteles

Dev Backend

Ruben Levi de Oliveira Cariolano

UI/UX Designer

Marcos Vinicius Bonfim Silva Evangelista

Analista de QA & Dados