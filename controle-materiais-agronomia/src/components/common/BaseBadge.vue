<script setup>
import { computed } from 'vue'

const props = defineProps({
  status: {
    type: String,
    required: true
  }
})

const badgeClasses = computed(() => {
  const map = {
    'Ativo': 'bg-emerald-100 text-emerald-800 border-emerald-200',
    'Disponível': 'bg-emerald-100 text-emerald-800 border-emerald-200',
    'Inativo': 'bg-gray-100 text-gray-600 border-gray-200',
    'Estoque baixo': 'bg-amber-100 text-amber-800 border-amber-200',
    'Sem estoque': 'bg-rose-100 text-rose-800 border-rose-200',
    'Saída': 'bg-blue-100 text-blue-800 border-blue-200',
    'Entrada': 'bg-emerald-100 text-emerald-800 border-emerald-200',
    'Devolução': 'bg-purple-100 text-purple-800 border-purple-200',
    'Em aprovação': 'bg-amber-100 text-amber-800 border-amber-200',
    'Parcialmente recebido': 'bg-purple-100 text-purple-800 border-purple-200',
    'Recebido': 'bg-emerald-100 text-emerald-800 border-emerald-200',
    'Cancelado': 'bg-gray-100 text-gray-600 border-gray-200',
    'Aprovado': 'bg-blue-100 text-blue-800 border-blue-200'
  }

  return map[props.status] || 'bg-gray-100 text-gray-700 border-gray-200'
})
</script>

<template>
  <span :class="[
    'inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium border',
    badgeClasses
  ]">
    {{ status }}
  </span>
</template>