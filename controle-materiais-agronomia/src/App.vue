<script setup>
import TheSidebar from './components/layout/TheSidebar.vue'
import TheHeader from './components/layout/TheHeader.vue'
</script>

<template>
  <div class="flex h-screen bg-slate-50 overflow-hidden font-sans">
    <!-- Menu Lateral Fixo -->
    <TheSidebar />

    <!-- Área de Conteúdo Principal -->
    <div class="flex-1 flex flex-col min-w-0 overflow-hidden">
      <!-- Cabeçalho -->
      <TheHeader />

      <!-- Conteúdo da Página Atual com Scroll Independente -->
      <main class="flex-1 overflow-y-auto p-8">
        <RouterView />
      </main>
    </div>
  </div>
</template>