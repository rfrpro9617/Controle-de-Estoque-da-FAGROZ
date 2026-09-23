<script setup>
defineProps({
  modelValue: [String, Number],
  label: String,
  options: {
    type: Array,
    default: () => [] // Array de { label: '', value: '' } ou strings
  },
  placeholder: { type: String, default: 'Selecione...' }
})

defineEmits(['update:modelValue'])
</script>

<template>
  <div class="space-y-1 text-left">
    <label v-if="label" class="block text-xs font-semibold text-gray-700">
      {{ label }}
    </label>
    <select :value="modelValue" @change="$emit('update:modelValue', $event.target.value)"
      class="w-full px-3 py-2 text-sm bg-white border border-gray-300 rounded-lg shadow-xs transition-colors focus:outline-none focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500">
      <option value="" disabled>{{ placeholder }}</option>
      <option v-for="opt in options" :key="typeof opt === 'object' ? opt.value : opt"
        :value="typeof opt === 'object' ? opt.value : opt">
        {{ typeof opt === 'object' ? opt.label : opt }}
      </option>
    </select>
  </div>
</template>