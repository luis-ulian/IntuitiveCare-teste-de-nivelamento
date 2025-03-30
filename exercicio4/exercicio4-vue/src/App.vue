<script setup>
import { onMounted, ref } from 'vue'
import RevoGrid from '@revolist/vue3-datagrid'
import api from './services/api'

const columns = ref([
  { prop: 'Registro_ANS', name: 'Registro ANS', size: 200 },
  { prop: 'CNPJ', name: 'CNPJ', size: 150},
  { prop: 'Razao_Social', name: 'Razão Social', size: 400},
  { prop: 'Modalidade', name: 'Modalidade', size: 350  },
  { prop: 'CEP', name: 'CEP', size: 250},
  { prop: 'Representante', name: 'Representante', size: 400},
]);

const empresas = ref([])

const fetchEmpresas = async () => {
  api.get("/empresas/")
  .then((response) => {
    empresas.value = response.data
  })
};

onMounted(fetchEmpresas);

console.log(empresas.value)
</script>

<template>
  <div>
    <h1 class="title">Dados Relatório CADOP</h1>
    <RevoGrid resize="true" hide-attribution theme="darkCompact" :columns="columns" :source="empresas"  />
  </div>
</template>

<style scoped lang="css">
@import 'bulma/css/bulma.min.css'
</style>