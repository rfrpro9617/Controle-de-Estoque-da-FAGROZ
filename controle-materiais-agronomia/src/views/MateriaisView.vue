<script setup>
import { ref, computed } from 'vue'
import { useMateriaisStore } from '../stores/useMateriaisStore'
import BaseTable from '../components/common/BaseTable.vue'
import BaseBadge from '../components/common/BaseBadge.vue'
import BaseModal from '../components/common/BaseModal.vue'
import BaseInput from '../components/common/BaseInput.vue'
import BaseSelect from '../components/common/BaseSelect.vue'

const store = useMateriaisStore()

// Estados locais
const search = ref('')
const isModalOpen = ref(false)

// Form do novo material
const form = ref({
  code: '',
  name: '',
  category: '',
  minimumStockLevel: 0,
  active: true
})

// Definição das colunas da tabela
const columns = [
  { key: 'id', label: 'CÓDIGO' },
  { key: 'name', label: 'NOME', cellClass: 'font-semibold text-gray-900' },
  { key: 'category', label: 'CATEGORIA' },
  { key: 'stock', label: 'ESTOQUE', cellClass: 'font-bold' },
  { key: 'status', label: 'STATUS' },
  { key: 'actions', label: 'AÇÕES', headerClass: 'text-right', cellClass: 'text-right' }
]

// Opções para os Selects
const categoryOptions = [
  'Limpeza e Manutenção',
  'Descartáveis e Utensílios',
  'Produtos Químicos',
  'Escritório e Papelaria',
  'Equipamentos e Eletrônicos'
]

// Filtro de busca reativo
const filteredMaterials = computed(() => {
  if (!search.value.trim()) return store.materiais
  const term = search.value.toLowerCase()
  return store.materiais.filter(item =>
    item.name.toLowerCase().includes(term) ||
    item.id.toLowerCase().includes(term) ||
    item.category.toLowerCase().includes(term)
  )
})

// Submissão do formulário
function saveNewMaterial() {
  if (!form.value.name || !form.value.category) {
    alert('Por favor, preencha os campos obrigatórios.')
    return
  }

  store.addMaterial(form.value)
  closeModal()
}

function closeModal() {
  isModalOpen.value = false
  form.value = { code: '', name: '', category: '', minimumStockLevel: 0, active: true }
}
</script>

<template>

  <div class="space-y-6">
    <!-- Cabeçalho da Tela -->
    <div class="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
      <div>
        <h2 class="text-2xl font-bold text-gray-900">Materiais</h2>
        <p class="text-xs text-gray-500 mt-1">Cadastro dos materiais controlados pelo almoxarifado</p>
      </div>

      <button @click="isModalOpen = true"
        class="bg-primary-800 hover:bg-primary-900 text-white text-xs font-semibold px-4 py-2.5 rounded-lg shadow-xs transition-colors flex items-center justify-center gap-2 cursor-pointer">
        <span>+</span> Novo material
      </button>
    </div>

    <!-- Barra de Filtros / Busca -->
    <div class="bg-white p-3 rounded-xl border border-gray-200 shadow-2xs">
      <div class="max-w-xs">
        <BaseInput v-model="search" placeholder="🔍 Pesquisar material..." />
      </div>
    </div>

    <!-- Tabela de Materiais -->
    <BaseTable :columns="colunas" :items="filteredMaterials">
      <template #cell-status="{ value }">
        <BaseBadge :status="value" />
      </template>

      <template #cell-acoes="{ item }">
        <div class="flex items-center justify-end gap-3 text-xs">
          <button class="text-gray-600 hover:text-emerald-700 font-medium cursor-pointer">Ver detalhes</button>
          <button @click="store.changeMaterialStatus(item.id)"
            class="text-gray-500 hover:text-red-600 font-medium cursor-pointer">
            {{ item.status === 'Inativo' ? 'Ativar' : 'Inativar material' }}
          </button>
        </div>
      </template>
    </BaseTable>

    <!-- Modal: Novo Material -->
    <BaseModal :open="isModalOpen" title="Novo material"
      subtitle="O material passa a ser controlado pelo estoque central após o cadastro." @close="closeModal">
      <form @submit.prevent="saveNewMaterial" class="space-y-4">
        <div class="grid grid-cols-2 gap-4">
          <BaseInput v-model="form.code" label="Código" placeholder="Ex.: MAT-010" />
          <BaseInput v-model="form.name" label="Nome *" placeholder="Ex.: Álcool 70%" />
        </div>

        <div class="grid grid-cols-2 gap-4">
          <BaseSelect v-model="form.category" label="Categoria *" :options="categoryOptions" />
        </div>

        <div class="grid grid-cols-2 gap-4 items-center">
          <BaseInput v-model="form.minimumStockLevel" type="number" label="Estoque mínimo"
            hint="Usado para o alerta de estoque baixo." />
          <div class="flex items-center gap-2 pt-2">
            <input type="checkbox" id="active" v-model="form.active"
              class="w-4 h-4 text-emerald-600 rounded-xs border-gray-300 focus:ring-emerald-500" />
            <label for="active" class="text-xs font-semibold text-gray-700">Ativo</label>
          </div>
        </div>

        <!-- Alerta informativo igual ao layout -->
        <div class="bg-gray-50 border border-gray-200 rounded-lg p-3 text-xs text-gray-500">
          O cadastro não altera o estoque. O saldo passa a existir a partir da primeira entrada registrada.
        </div>
      </form>

      <template #footer>
        <button type="button" @click="closeModal"
          class="px-4 py-2 text-xs font-semibold text-gray-600 hover:bg-gray-100 rounded-lg transition-colors cursor-pointer">
          Cancelar
        </button>
        <button type="button" @click="saveNewMaterial"
          class="px-4 py-2 text-xs font-semibold text-white bg-emerald-600 hover:bg-emerald-700 rounded-lg transition-colors shadow-2xs cursor-pointer">
          Salvar material
        </button>
      </template>
    </BaseModal>
  </div>
</template>