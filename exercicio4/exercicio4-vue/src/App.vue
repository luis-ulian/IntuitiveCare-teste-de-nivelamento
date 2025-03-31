<script setup>
import { onMounted, ref } from 'vue'
import RevoGrid from '@revolist/vue3-datagrid'
import api from './services/api'

const columns = ref([
  { prop: 'Registro_ANS', name: 'Registro ANS', size: 200, readonly: true},
  { prop: 'CNPJ', name: 'CNPJ', size: 150, readonly: true},
  { prop: 'Razao_Social', name: 'Razão Social', size: 400, readonly: true},
  { prop: 'Modalidade', name: 'Modalidade', size: 250, readonly: true},
  { prop: 'CEP', name: 'CEP', size: 250, readonly: true},
  { prop: 'Representante', name: 'Representante', size: 400, readonly: true},
]);

const empresas = ref()

const fetchEmpresas = async () => {
  api.get("/empresas/")
  .then((response) => { 
    empresas.value = JSON.parse(response.data)
  })
};

onMounted(fetchEmpresas);

</script>

<template>
  <div>
    <h1 class="title">Dados Relatório CADOP</h1>
    <RevoGrid :style="true" :resize="true" :auto-size-column="true" class="grid" hide-attribution theme="darkCompact" :columns="columns" :source="empresas"  />
  </div>
</template>

<style scoped lang="css">
@import 'bulma/css/bulma.min.css';

.grid{
  height: 50rem;
}

.title{
  display: flex;
  justify-content: center;
  padding-top: 20px
}

</style>