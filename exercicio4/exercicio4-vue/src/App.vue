<template>
  <RevoGrid resize="true" hide-attribution theme="darkCompact" :columns="columns" :source="empresas" />
</template>

<script setup>
import { ref } from 'vue'
import RevoGrid from '@revolist/vue3-datagrid'

const empresas = [{ 
  registroANS: '123123',
  CNPJ: '5674568',
  razaoSocial: 'razaoSocial', 
  modalidade: 'modalidade',
  CEP: '456745674567',
  representante: 'representante'
 },{ 
  registroANS: '31331',
  CNPJ: '2352677',
  razaoSocial: 'teste teste', 
  modalidade: 'does things',
  CEP: '95076110',
  representante: 'sao antonio'
 },{ 
  registroANS: '567435735468',
  CNPJ: '969696969',
  razaoSocial: 'nnome teste', 
  modalidade: 'do not does things',
  CEP: '959595995',
  representante: 'ninguem'
 }
]

const columns = ref([
  { prop: 'registroANS', name: 'Registro ANS', size: 200 },
  { prop: 'CNPJ', name: 'CNPJ', size: 150},
  { prop: 'razaoSocial', name: 'Razão Social', size: 400},
  { prop: 'modalidade', name: 'Modalidade', size: 350  },
  { prop: 'CEP', name: 'CEP', size: 250},
  { prop: 'representante', name: 'Representante', size: 400},
])
const rows = ref([
  {
      
  },
])

</script>

<style>
  @import 'bulma/css/bulma.min.css'

</style>