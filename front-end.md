# Layout Global

- Sidebar
- Header

# Componentes Reutilizaveis UI

- Badge (Ativo, Inativo, Disponível, Estoque Baixo, Sem Estoque, Saída, Entrada, Devolução)

# Views

- DashboardView
- EstoqueView
- DistribuicaoSetoresView
- MovimentaçõesView
- PedidosView
- ...

# Gerenciamento de Estado

- Por que usar Pinia para  centralizar o estado?
- Porque quando você faz uma Nova entrada ou Registrar devolução, o estoque precisa atualizar automaticamente no Estoque, na Dashboard e aparecer no histórico de Movimentações.
- BIZU: uma alteração reflete em várias telas.

# Como foi importado o tailwindcss?

Vue
 ↓
main.js
 ↓
style.css
 ↓
Tailwind CSS

# Rotas

O que vira uma rota? - Uma tela que o usuário consegue acessar pela URL.
Uma regra: se eu clica nisso deve mudar a tela? Sim, provalmente é uma rota.