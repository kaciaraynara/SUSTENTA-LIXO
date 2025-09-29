Requisitos do Sistema Sustenta CE


1. Requisitos Funcionais (RF)
RF01: O sistema deve permitir que o usuário (cidadão) crie uma conta e faça login.

RF02: O usuário deve ser capaz de criar um novo relato de lixo, incluindo foto, geolocalização e uma breve descrição.

RF03: O usuário deve poder visualizar um mapa com todos os relatos de lixo próximos a sua localização.

RF04: O usuário deve ter acesso a um histórico dos relatos que ele criou.

RF05: O gestor da prefeitura deve ser capaz de fazer login em um painel web.

RF06: O painel do gestor deve exibir uma lista de todos os relatos de lixo.

RF07: O gestor deve ser capaz de filtrar os relatos por status (ex: "Aberto", "Em Andamento", "Resolvido").

RF08: O gestor deve ser capaz de alterar o status de um relato.

RF09: O gestor deve poder atribuir um relato a uma equipe de coleta específica.

RF10: O sistema deve permitir que o gestor cadastre novas equipes.

2. Requisitos Não-Funcionais (RNF)
RNF01 (Desempenho): O tempo de carregamento das telas de mapa e lista de relatos deve ser inferior a 3 segundos.

RNF02 (Segurança): O sistema deve utilizar autenticação segura (JWT) para proteger os dados do usuário e do gestor.

RNF03 (Usabilidade): A interface do aplicativo mobile deve ser intuitiva e fácil de usar para qualquer pessoa, independentemente de sua familiaridade com tecnologia.

RNF04 (Disponibilidade): O sistema deve estar disponível 99,9% do tempo.

RNF05 (Escalabilidade): A arquitetura deve suportar um crescimento futuro no número de usuários e relatos sem comprometer a performance.

RNF06 (Compatibilidade): O aplicativo mobile deve ser compatível com as versões mais recentes dos sistemas operacionais iOS e Android.


3. Histórias de Usuário
Como Cidadão, eu quero relatar um lixo para que a prefeitura possa resolver o problema.

Como Cidadão, eu quero ver no mapa onde estão os pontos de lixo para poder evitá-los.

Como Cidadão, eu quero ver o status do meu relato para saber se ele foi recebido e se está sendo resolvido.

Como Gestor, eu quero ver todos os relatos de lixo em uma lista para poder gerenciá-los facilmente.

Como Gestor, eu quero atribuir um relato a uma equipe para garantir que o problema seja resolvido.

Como Gestor, eu quero ver o histórico de uma ocorrência para entender o que foi feito até o momento.