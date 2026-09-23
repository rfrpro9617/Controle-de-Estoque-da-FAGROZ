<script setup>
defineProps({
  open: {
    type: Boolean,
    default: false
  },
  title: {
    type: String,
    default: ''
  },
  subtitle: {
    type: String,
    default: ''
  }
})

const emit = defineEmits(['close'])
</script>

<template>
  <Teleport to="body">
    <div v-if="open"
      class="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/50 backdrop-blur-xs transition-opacity"
      @click.self="emit('close')">
      <div
        class="bg-white rounded-xl shadow-xl border border-gray-100 w-full max-w-lg overflow-hidden flex flex-col max-h-[90vh]">
        <!-- Topo do Modal -->
        <div class="p-5 border-b border-gray-100 flex items-start justify-between bg-white">
          <div>
            <h3 class="text-base font-bold text-gray-900">{{ title }}</h3>
            <p v-if="subtitle" class="text-xs text-gray-500 mt-0.5">{{ subtitle }}</p>
          </div>
          <button @click="emit('close')" class="text-gray-400 hover:text-gray-600 rounded-lg p-1 transition-colors">
            ✕
          </button>
        </div>

        <!-- Corpo do Modal -->
        <div class="p-5 overflow-y-auto space-y-4 text-sm">
          <slot />
        </div>

        <!-- Ações do Rodapé (opcional) -->
        <div v-if="$slots.footer" class="p-4 border-t border-gray-100 bg-gray-50/50 flex justify-end gap-3">
          <slot name="footer" />
        </div>
      </div>
    </div>
  </Teleport>
</template>