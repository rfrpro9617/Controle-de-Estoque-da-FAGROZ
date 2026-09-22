import { createRouter, createWebHistory } from 'vue-router'

const routes = [
  {
    path: '/',
    name: 'dashboard',
    component: () => import('../views/DashboardView.vue')
  },
  {
    path: '/estoque',
    name: 'estoque',
    component: () => import('../views/EstoqueView.vue')
  },
  {
    path: '/distribuido',
    name: 'distribuido',
    component: () => import('../views/DistribuidoSetoresView.vue')
  },
  {
    path: '/movimentacoes',
    name: 'movimentacoes',
    component: () => import('../views/MovimentacoesView.vue')
  },
  {
    path: '/pedidos',
    name: 'pedidos',
    component: () => import('../views/PedidosView.vue')
  },
  {
    path: '/gastos',
    name: 'gastos',
    component: () => import('../views/GastosView.vue')
  },
  {
    path: '/materiais',
    name: 'materiais',
    component: () => import('../views/MateriaisView.vue')
  },
  {
    path: '/categorias',
    name: 'categorias',
    component: () => import('../views/CategoriasView.vue')
  },
  {
    path: '/setores',
    name: 'setores',
    component: () => import('../views/SetoresView.vue')
  },
  {
    path: '/fornecedores',
    name: 'fornecedores',
    component: () => import('../views/FornecedoresView.vue')
  },
  {
    path: '/configuracoes',
    name: 'configuracoes',
    component: () => import('../views/ConfiguracoesView.vue')
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router