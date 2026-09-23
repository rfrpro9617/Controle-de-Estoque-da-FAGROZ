<script setup>
import { RouterLink } from 'vue-router'
import {
  ArrowLeftRight,
  ArrowUpDown,
  BadgeDollarSign,
  Building2,
  LayoutDashboard,
  LogOut,
  Sprout,
  Package,
  Settings,
  ShoppingCart,
  Tags,
  Truck,
} from '@lucide/vue'

const groupMenus = [
  {
    title: 'OPERAÇÃO',
    itens: [
      { name: 'Dashboard', path: '/', icon: LayoutDashboard },
      { name: 'Estoque', path: '/estoque', icon: Package },
      { name: 'Distribuído aos Setores', path: '/distribuido', icon: ArrowLeftRight },
      { name: 'Movimentações', path: '/movimentacoes', icon: ArrowUpDown },
    ]
  },
  {
    title: 'COMPRAS',
    itens: [
      { name: 'Pedidos', path: '/pedidos', icon: ShoppingCart },
      { name: 'Gastos', path: '/gastos', icon: BadgeDollarSign },
    ]
  },
  {
    title: 'CADASTROS',
    itens: [
      { name: 'Materiais', path: '/materiais', icon: Package },
      { name: 'Categorias', path: '/categorias', icon: Tags },
      { name: 'Setores', path: '/setores', icon: Building2 },
      { name: 'Fornecedores', path: '/fornecedores', icon: Truck },
    ]
  }
]
</script>

<template>
  <!-- select-none: Impede a seleção de texto ao arrastar o mouse -->
  <aside class="w-64 bg-white border-r border-gray-200 flex flex-col h-screen select-none shrink-0">
    <!-- Header Sidebar (Logo + name) -->
    <div class="p-4 border-b border-gray-100 flex items-center gap-3">
      <div class="w-9 h-9 bg-green-800 flex items-center justify-center rounded-lg">
        <Sprout :size="18" color="white" />
      </div>
      <div>
        <h1 class="font-bold text-gray-900 text-sm leading-tight">Agronomia</h1>
        <p class="text-xs text-gray-500">Controle de Materiais</p>
      </div>
    </div>

    <!-- Navegação das Rotas -->
    <nav class="flex-1 overflow-y-auto p-4 space-y-6">
      <div v-for="group in groupMenus" :key="group.title">
        <span class="text-[10px] font-bold text-gray-400 tracking-wider uppercase mb-2 block px-2">
          {{ group.title }}
        </span>
        <ul class="space-y-1">
          <li v-for="item in group.itens" :key="item.path">
            <RouterLink :to="item.path"
              class="flex items-center gap-2.5 px-3 py-2 text-sm text-gray-600 rounded-lg transition-colors hover:bg-gray-100 font-medium"
              active-class="bg-emerald-50 text-emerald-800 font-semibold">
              <component :is="item.icon" :size="16" class="shrink-0" />
              <span>{{ item.name }}</span>
            </RouterLink>
          </li>
        </ul>
      </div>
    </nav>

    <!-- Rodapé: Usuário e Ações Principais -->
    <div class="border-t border-gray-100 p-3 space-y-2">
      <div class="p-2 rounded-lg flex items-center gap-3">
        <div
          class="w-8 h-8 rounded-full bg-emerald-100 text-emerald-800 flex items-center justify-center font-bold text-xs">
          SJSDS
        </div>
        <div class="flex-1 overflow-hidden">
          <p class="text-xs font-semibold text-gray-800 truncate">SARÁI JULIANA SANTOS DOS SANTOS</p>
          <p class="text-[11px] text-gray-400 truncate">Gerente Administrativa da FAGRO</p>
        </div>
      </div>

      <div class="pt-1 border-t border-gray-100 space-y-0.5">
        <RouterLink to="/configuracoes"
          class="flex items-center gap-2 px-3 py-1.5 text-xs text-gray-600 rounded-md hover:bg-gray-100"
          active-class="bg-emerald-50 text-emerald-800 font-semibold">
          <Settings :size="14" class="shrink-0" />
          <span>Configurações</span>
        </RouterLink>
        <button
          class="w-full flex items-center gap-2 px-3 py-1.5 text-xs text-red-600 rounded-md hover:bg-red-50 transition-colors text-left">
          <LogOut :size="14" class="shrink-0" />
          <span>Sair</span>
        </button>
      </div>
    </div>
  </aside>
</template>