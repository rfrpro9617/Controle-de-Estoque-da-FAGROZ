from pathlib import Path

content = """# Arquitetura e Guia de Construção — Sistema de Estoque

## 1. Arquitetura definida

```text
┌──────────────────────────────┐
│          USUÁRIO             │
│      Navegador/Desktop       │
└──────────────┬───────────────┘
               │ HTTPS
               ▼
┌──────────────────────────────┐
│          FRONTEND            │
│                              │
│ Vue 3                        │
│ TypeScript                   │
│ Vite                         │
│ Vue Router                   │
└──────────────┬───────────────┘
               │ REST API / JSON
               ▼
┌──────────────────────────────┐
│           BACKEND            │
│                              │
│ PHP                          │
│ Laravel                      │
│ Eloquent ORM                 │
│                              │
│ ┌──────────────────────────┐ │
│ │ Auth / Usuários          │ │
│ │ Categorias               │ │
│ │ Unidades                 │ │
│ │ Setores                  │ │
│ │ Fornecedores             │ │
│ │ Materiais                │ │
│ │ Estoque                  │ │
│ │ Movimentações            │ │
│ │ Pedidos                  │ │
│ │ Gastos                   │ │
│ │ Dashboard                │ │
│ └──────────────────────────┘ │
└──────────────┬───────────────┘
               │
               ▼
┌──────────────────────────────┐
│       MySQL EXISTENTE        │
│       Banco institucional    │
└──────────────────────────────┘
               │
               ▼
       Servidor Ubuntu UFRGS
       Nginx + PHP-FPM
Princípios
O Lovable foi utilizado somente para prototipação e apresentação à chefia. Não define a arquitetura de produção.
Vue 3 é responsável pela interface.
Laravel é responsável pela API, regras de negócio e acesso ao banco.
Eloquent ORM será utilizado para interação com MySQL.
O frontend nunca acessa o MySQL diretamente.
O MySQL existente deve ser analisado antes de qualquer alteração.
Entrada, saída e devolução devem ser executadas pelo backend dentro de transações.
A aplicação será um monólito modular.
Não utilizar microserviços sem necessidade real.
Evitar dezenas de camadas, abstrações e padrões sem benefício concreto.
Não alterar o banco antes de entender seu modelo e possíveis impactos.
Regras ainda não confirmadas devem ser marcadas como INFORMAÇÃO DESCONHECIDA.
Inicialmente não utilizar Docker, salvo necessidade concreta posterior.
Priorizar ferramentas gratuitas e adequadas à infraestrutura institucional.
2. Estratégia de desenvolvimento

A recomendação é desenvolver backend primeiro, mas não construir todo o backend antes do frontend.

O projeto será construído em fatias verticais:

BANCO
  ↓
BACKEND
  ↓
API
  ↓
FRONTEND
  ↓
TELA FUNCIONANDO
  ↓
TESTE
  ↓
PRÓXIMO MÓDULO

Isso evita construir telas que depois não consigam funcionar com as regras reais.

3. Fase 0 — Levantamento

Antes de programar, entender o banco e as regras existentes.

Não começar criando migrations.

Levantar:

tabelas;
colunas;
tipos de dados;
chaves primárias;
chaves estrangeiras;
índices;
restrições;
relacionamentos;
usuários;
materiais;
categorias;
unidades;
setores;
fornecedores;
estoque;
movimentações;
pedidos;
gastos;
demais estruturas relevantes.

Exemplo ilustrativo:

categorias
     │
     └── materiais
             │
             ├── entradas
             ├── saídas
             └── devoluções
                    │
                    └── setores

Os relacionamentos reais devem ser confirmados através do banco.

Regra importante

Não inventar regras.

Quando algo não estiver confirmado:

INFORMAÇÃO DESCONHECIDA

A informação deverá ser investigada antes de virar regra de negócio.

4. Fase 1 — Preparar o backend
4.1 Criar o projeto Laravel

Criar:

backend/

Configurar:

PHP;
Composer;
Laravel;
ambiente de desenvolvimento;
.env;
conexão com MySQL;
configurações básicas.
4.2 Testar conexão com MySQL

Primeiro objetivo técnico:

Laravel
   ↓
MySQL
   ↓
SELECT
   ↓
dados retornados

Somente depois de confirmar a comunicação avançar.

5. Fase 2 — Autenticação

Definir e implementar:

como o usuário será autenticado;
onde os usuários estão cadastrados;
como as senhas são armazenadas;
login;
logout;
sessão/token;
perfis;
permissões.

Não assumir antecipadamente um modelo de autenticação sem verificar os requisitos do sistema.

6. Fase 3 — Primeiro CRUD: Categorias

O primeiro CRUD completo deve demonstrar:

MySQL
 ↓
Laravel Model
 ↓
Controller
 ↓
API
 ↓
Vue
 ↓
Tela

Exemplo:

GET    /api/categorias
POST   /api/categorias
PUT    /api/categorias/{id}
DELETE /api/categorias/{id}

O objetivo é validar o ciclo completo da aplicação.

7. Fase 4 — CRUDs de apoio

Depois:

Categorias
     ↓
Unidades
     ↓
Setores
     ↓
Fornecedores

Consolidar:

Laravel;
Eloquent;
Controllers;
validações;
APIs;
Vue;
formulários;
listagens;
tratamento de erros.
8. Fase 5 — Materiais

Dependências:

Categoria
    +
Unidade
    ↓
Material

Funcionalidades:

listar;
cadastrar;
editar;
inativar;
visualizar detalhes;
visualizar saldo.

O status do material, como Disponível, Estoque baixo e Sem estoque, deve ser derivado quando essa for a regra confirmada, em vez de ser armazenado desnecessariamente.

9. Fase 6 — Estoque
9.1 Entrada
Fornecedor
   ↓
Material
   ↓
Quantidade
   ↓
ESTOQUE CENTRAL
9.2 Saída
ESTOQUE CENTRAL
      ↓
  quantidade
      ↓
    SETOR

Validar saldo disponível antes de efetivar.

9.3 Devolução
SETOR
  ↓
Material
  ↓
Quantidade
  ↓
ESTOQUE CENTRAL

Validar se o setor possui a quantidade que está sendo devolvida.

Regra crítica

As operações não devem depender de duas atualizações independentes feitas pelo frontend.

Devem ocorrer no backend dentro de uma transação:

BEGIN TRANSACTION
        ↓
validar
        ↓
alterar estoque
        ↓
registrar movimentação
        ↓
COMMIT

Em caso de erro:

ROLLBACK
10. Fase 7 — Movimentações

Criar histórico de:

entradas;
saídas;
devoluções;
material;
quantidade;
setor;
fornecedor, quando aplicável;
usuário responsável;
data;
demais informações confirmadas.

Adicionar filtros adequados.

11. Fase 8 — Pedidos

Estrutura conceitual:

Pedido
 ├── itens
 ├── recebimento
 └── entrada no estoque

Implementar:

Lista de pedidos.
Filtros.
Criação do pedido.
Cabeçalho.
Itens.
Detalhes.
Recebimento parcial.
Recebimento total.
Integração com entrada de estoque.

As regras exatas devem ser confirmadas antes da implementação.

12. Fase 9 — Gastos

Depois dos pedidos e recebimentos, implementar os gastos.

Esses dados poderão alimentar o dashboard.

13. Fase 10 — Dashboard

O dashboard deve ficar por último porque depende dos demais módulos:

Materiais
   +
Estoque
   +
Entradas
   +
Saídas
   +
Devoluções
   +
Pedidos
   +
Gastos
      ↓
  DASHBOARD
14. Fase 11 — Permissões e refinamentos

Depois das principais funcionalidades:

aplicar permissões por perfil;
revisar acesso às telas;
revisar acesso aos endpoints;
melhorar mensagens de erro;
revisar validações;
revisar estados;
melhorar filtros;
revisar usabilidade;
tratar casos extremos.

As permissões não devem ficar somente no frontend. O backend também deve validar autorização.

15. Fase 12 — Testes

Antes do deploy:

autenticação;
permissões;
CRUDs;
entradas;
saídas;
devoluções;
transações;
saldo insuficiente;
devolução inválida;
concorrência quando relevante;
validações;
erros da API;
comportamento do frontend.
16. Fase 13 — Deploy

Estrutura inicial:

Ubuntu UFRGS
     │
     ├── Nginx
     │
     ├── PHP-FPM
     │
     ├── Laravel
     │
     └── Vue buildado
             │
             ▼
           HTTPS

Antes do deploy verificar:

acesso à VM;
conectividade com MySQL;
firewall;
DNS;
HTTPS/certificado;
portas;
VPN;
política de acesso externo;
backups;
atualizações;
monitoramento;
logs.
17. Ordem completa
1. LEVANTAR BANCO
        ↓
2. ANALISAR REGRAS
        ↓
3. PREPARAR LARAVEL
        ↓
4. CONECTAR MYSQL
        ↓
5. AUTENTICAÇÃO
        ↓
6. CATEGORIAS
        ↓
7. UNIDADES
        ↓
8. SETORES
        ↓
9. FORNECEDORES
        ↓
10. MATERIAIS
        ↓
11. ESTOQUE
        ↓
12. ENTRADA
        ↓
13. SAÍDA
        ↓
14. DEVOLUÇÃO
        ↓
15. MOVIMENTAÇÕES
        ↓
16. PEDIDOS
        ↓
17. GASTOS
        ↓
18. DASHBOARD
        ↓
19. PERMISSÕES
        ↓
20. TESTES
        ↓
21. DEPLOY UFRGS
18. Regra de desenvolvimento

Não fazer:

❌ Todo backend
      ↓
❌ Depois todo frontend

Fazer:

✅ Backend do módulo
      ↓
✅ API
      ↓
✅ Frontend do módulo
      ↓
✅ Teste
      ↓
✅ Próximo módulo

Isso permite aprender Laravel gradualmente, validar a arquitetura desde cedo e reduzir retrabalho.

19. Primeiro passo real

O primeiro passo do projeto não é criar uma tela Vue.

Também não é criar migrations.

É:

Levantar e entender o banco MySQL existente.

Somente depois de conhecer o banco e as regras podemos decidir exatamente como os Models, relacionamentos, APIs e telas serão construídos.
"""

path = Path("/mnt/data/arquitetura_e_guia_sistema_estoque.md")
path.write_text(content, encoding="utf-8")
print(f"Arquivo criado: {path}")
```
