<script setup>
defineProps({
  columns: {
    type: Array,
    required: true // Array ex: [{ key: 'nome', label: 'NOME' }]
  },
  items: {
    type: Array,
    required: true
  }
})
</script>

<template>
  <div class="w-full bg-white border border-gray-200 rounded-xl shadow-2xs overflow-hidden">
    <div class="overflow-x-auto">
      <table class="w-full text-left border-collapse">
        <thead>
          <tr
            class="bg-gray-50/80 border-b border-gray-200 text-[10px] font-bold text-gray-500 uppercase tracking-wider">
            <th v-for="col in columns" :key="col.key" class="px-4 py-3" :class="col.headerClass">
              {{ col.label }}
            </th>
          </tr>
        </thead>
        <tbody class="divide-y divide-gray-100 text-sm">
          <tr v-if="items.length === 0">
            <td :colspan="columns.length" class="px-4 py-8 text-center text-gray-400 text-xs">
              Nenhum registo encontrado.
            </td>
          </tr>
          <tr v-for="(item, index) in items" :key="item.id || index" class="hover:bg-gray-50/50 transition-colors">
            <td v-for="col in columns" :key="col.key" class="px-4 py-3 text-gray-700" :class="col.cellClass">
              <!-- Slot dinâmico para personalização por chave (ex: #cell-status) -->
              <slot :name="`cell-${col.key}`" :item="item" :value="item[col.key]">
                {{ item[col.key] }}
              </slot>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>