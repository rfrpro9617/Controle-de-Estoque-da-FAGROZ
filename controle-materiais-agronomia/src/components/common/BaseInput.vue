<script setup>
defineProps({
  modelValue: [String, Number],
  label: String,
  type: { type: String, default: 'text' },
  placeholder: String,
  disabled: Boolean,
  hint: String
})

defineEmits(['update:modelValue'])
</script>

<template>
  <div class="space-y-1 text-left">
    <label v-if="label" class="block text-xs font-semibold text-gray-700">
      {{ label }}
    </label>
    <input :type="type" :value="modelValue" :placeholder="placeholder" :disabled="disabled"
      @input="$emit('update:modelValue', $event.target.value)"
      class="w-full px-3 py-2 text-sm bg-white border border-gray-300 rounded-lg shadow-xs transition-colors focus:outline-none focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500 disabled:bg-gray-100 disabled:text-gray-400" />
    <p v-if="hint" class="text-[11px] text-gray-400 mt-1">{{ hint }}</p>
  </div>
</template>