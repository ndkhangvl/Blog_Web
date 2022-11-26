import { createApp } from 'vue'
import 'bootstrap/dist/css/bootstrap.min.css';
import '@fortawesome/fontawesome-free/css/all.min.css';
import { createPinia } from "pinia";
//import piniaPluginPersistedstate from "pinia-plugin-persistedstate";
import App from './App.vue'

import './assets/main.css';

import router from './router';
const pinia = createPinia();

//pinia.use(piniaPluginPersistedstate);
createApp(App).use(router).use(pinia).mount('#app');