import { createApp } from 'vue'
import 'bootstrap/dist/css/bootstrap.min.css';
import '@fortawesome/fontawesome-free/css/all.min.css';
import App from './App.vue'

import './assets/main.css'

import router from './router';

createApp(App).use(router).mount('#app');