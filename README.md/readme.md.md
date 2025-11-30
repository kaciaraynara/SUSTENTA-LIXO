SUSTENTA CE: IMPLEMENTAÇÃO DO SISTEMA MULTIPLATAFORMA (N708)

Este repositório contém o código-fonte funcional do sistema Sustenta CE, desenvolvido para a Etapa 2 do Projeto Aplicado Multiplatforma, em alinhamento com o ODS 11 (Cidades e Comunidades Sustentáveis).

1. Funcionalidades Implementadas

O sistema foi implementado seguindo os requisitos da Etapa 1 e o foco na solução multiplataforma:

App Mobile (Cidadão): Criação de relatos com geolocalização, visualização do histórico e funcionalidades de localização e reporte rápido.

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





3. Instruções de Acesso e Execução

O sistema está configurado para o ambiente de execução do Canvas, utilizando o token de autenticação automático.

App Mobile: Abrir o arquivo frontend/mobile/index.html em qualquer navegador.

Painel Gestor: Abrir o arquivo frontend/web/index.html em qualquer navegador.

Credenciais de Teste: O sistema utiliza a autenticação automática do Canvas (__initial_auth_token).








4. Validação com Público-Alvo (Obrigatório)

O projeto foi validado para garantir que fosse útil e utilizável pelo público real (Morador/Cidadão).


(O relatório completo da validação, o feedback e as evidências estão na pasta validation/.)






5. Estrutura do Repositório (Etapa 2)

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