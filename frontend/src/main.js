import { createApp } from 'vue'
import 'bootstrap/dist/css/bootstrap.min.css';
import '@fortawesome/fontawesome-free/css/all.min.css';
import { createPinia } from "pinia";
import Toaster from '@meforma/vue-toaster';
//import piniaPluginPersistedstate from "pinia-plugin-persistedstate";
import App from './App.vue'

import './assets/main.css';

import router from './router';
const pinia = createPinia();

//pinia.use(piniaPluginPersistedstate);
createApp(App).use(router).use(Toaster, {position: 'bottom-right', duration: 1000}).use(pinia).mount('#app');