import { createApp } from 'vue';
import { createPinia } from "pinia";
import 'bootstrap/dist/css/bootstrap.min.css';
import '@fortawesome/fontawesome-free/css/all.min.css';
import App from './App.vue';

import './assets/main.css';

import router from './router';

const pinia = createPinia()
createApp(App).use(router).use(pinia).mount('#app');