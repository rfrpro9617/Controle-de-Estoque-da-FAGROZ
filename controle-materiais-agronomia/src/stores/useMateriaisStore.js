import { defineStore } from 'pinia'
import { ref, computed } from 'vue'

export const useMateriaisStore = defineStore('materiais', () => {
  // Lista inicial de materiais baseada nas imagens de protótipo
  const materiais = ref([
    { id: 'MAT-001', name: 'Papel Higiênico', category: 'Limpeza e Manutenção', stockc: 320, minimumStockLevel: 50, status: 'Disponível' },
    { id: 'MAT-002', name: 'Papel Toalha', category: 'Descartáveis e Utensílios', stockc: 120, minimumStockLevel: 150, status: 'Estoque baixo' },
    { id: 'MAT-003', name: 'Detergente', category: 'Limpeza e Manutenção', stockc: 0, minimumStockLevel: 20, status: 'Sem estoque' },
    { id: 'MAT-004', name: 'Água Sanitária', category: 'Produtos Químicos', stockc: 80, minimumStockLevel: 30, status: 'Disponível' },
    { id: 'MAT-005', name: 'Papel A4', category: 'Escritório e Papelaria', stockc: 500, minimumStockLevel: 100, status: 'Disponível' },
    { id: 'MAT-006', name: 'Desinfetante', category: 'Produtos Químicos', stockc: 90, minimumStockLevel: 25, status: 'Disponível' },
    { id: 'MAT-007', name: 'Limpador Multiuso', category: 'Limpeza e Manutenção', stockc: 60, minimumStockLevel: 100, status: 'Estoque baixo' },
    { id: 'MAT-008', name: 'Saco para Lixo Alta Resistência', category: 'Descartáveis e Utensílios', stockc: 158, minimumStockLevel: 50, status: 'Disponível' },
    { id: 'MAT-009', name: 'Sabonete Líquido', category: 'Limpeza e Manutenção', stockc: 100, minimumStockLevel: 30, status: 'Disponível' }
  ])

  // Função auxiliar para recalcular o status com base no estoque atual
  function calculateStatus(stockc, minimumStockLevel) {
    if (stockc === 0) return 'Sem estoque'
    if (stockc <= minimumStockLevel) return 'Estoque baixo'
    return 'Disponível'
  }

  // Ação para cadastrar novo material (Modal "Novo material")
  function addMaterial(payload) {
    const nextNumber = materiais.value.length + 1
    const formattedCode = `MAT-${String(nextNumber).padStart(3, '0')}`

    const newItem = {
      id: payload.code || formattedCode,
      name: payload.name,
      category: payload.category,
      stockc: 0,
      minimumStockLevel: Number(payload.minimumStockLevel) || 0,
      status: 'Sem estoque'
    }

    materiais.value.unshift(newItem)
  }

  // Ação para inativar ou alterar status
  function changeMaterialStatus(id) {
    const item = materiais.value.find(m => m.id === id)
    if (item) {
      item.status = item.status === 'Inativo' ? calculateStatus(item.stockc, item.minimumStockLevel) : 'Inativo'
    }
  }

  return {
    materiais,
    addMaterial,
    changeMaterialStatus
  }
})