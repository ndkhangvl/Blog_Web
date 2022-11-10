import {createWebHistory, createRouter} from 'vue-router';
//import Home from "@view/Home.vue";

const routes = [
    // {
    //     path:'/',
    //     name: 'contactbook',
    //     component: Home, 
    // },

    // {
    //     path: '/register',
    //     name: 'register.add',
    //     component: () => import('@/views/Register.vue'),
    // },
];

const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),
    routes,
});

export default router;