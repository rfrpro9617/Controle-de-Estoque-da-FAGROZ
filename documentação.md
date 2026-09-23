          # DOCUMENTAÇÃO

# CONCEITOS GERAIS DE VUE.JS

## Gerenciamento de Estado

- Por que usar Pinia para  centralizar o estado?
- Porque quando você faz uma Nova entrada ou Registrar devolução, o estoque precisa atualizar automaticamente no Estoque, na Dashboard e aparecer no histórico de Movimentações.
- BIZU: uma alteração reflete em várias telas.
- O que for local deve ficar no layou, view, componente.

-----

## Quando usar computed?

- É um valor obtido a partir de outros dados?
  - Sim, usar computed.
  - Não, talvez seja função.
- Calculado quando é acessado pela primeira vez, ou quando alguma dependência reativa muda.
- O Vue.js faz cache de computed quando você acessa novamente e ele não mudou o valor.

-----

## Rotas

O que vira uma rota? - Uma tela que o usuário consegue acessar pela URL.
Uma regra: se eu clica nisso deve mudar a tela? Sim, provalmente é uma rota.

-----

## ESTRUTURA DOS ARQUIVOS

## Layout Global

  # TheSidebar

  - Itens da sidebar claramemte podem ser representados por uma estrutura de dados - Lista de objetos.
    - groupMenus

  # TheHeader

  - formattedNames é uma computed para obter o nome do breadcrump formatado.

-----

## Componentes Reutilizaveis UI

- Badge (Ativo, Inativo, Disponível, Estoque Baixo, Sem Estoque, Saída, Entrada, Devolução)

## Views

- DashboardView
- EstoqueView
- DistribuicaoSetoresView
- MovimentaçõesView
- PedidosView
- ...

-----

## Stores

  # useMateriaisStore

-----