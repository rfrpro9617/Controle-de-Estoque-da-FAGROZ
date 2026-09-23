<script setup>
import { computed } from 'vue'
import { useRoute } from 'vue-router'
import { ChevronRight } from '@lucide/vue'

const route = useRoute()

// Mapeamento visual do nome das rotas para o Breadcrumb
const formattedNames = {
  dashboard: 'Dashboard',
  estoque: 'Estoque',
  distribuido: 'Distribuído aos Setores',
  movimentacoes: 'Movimentações',
  pedidos: 'Pedidos',
  gastos: 'Gastos',
  materiais: 'Materiais',
  categorias: 'Categorias',
  setores: 'Setores',
  fornecedores: 'Fornecedores',
  configuracoes: 'Configurações'
}

const actualTitle = computed(() => formattedNames[route.name] || '')
</script>

<template>
  <header class="bg-white border-b border-gray-200 px-8 py-3 flex items-center justify-between">
    <!-- Breadcrumb -->
    <div class="flex items-center gap-2 text-xs text-gray-500">
      <span class="hover:text-gray-700 cursor-pointer">Início</span>
      <ChevronRight :size="14" aria-hidden="true" />
      <span class="font-semibold text-gray-800">{{ actualTitle }}</span>
    </div>

    <!-- Indicador do Período/Mês -->
    <div class="bg-gray-100 text-gray-600 px-3 py-1 rounded-full text-xs font-medium">
      Agosto/2026
    </div>
  </header>
</template>