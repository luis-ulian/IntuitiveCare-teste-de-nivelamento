import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import axios from 'axios'
import store from '@/store/index.js'
axios.defaults.baseURL = 'http://127.0.0.1:8000'

createApp(App).use(store).use(router, axios).mount('#app')
