import {createWebHistory, createRouter} from 'vue-router';
//import Home from "@view/Home.vue";

const routes = [
    {
        path:'/',
        name: 'Home',
        component: () => import('@/components/Login.vue'), 
    },

    {
        path:'/login',
        name: 'Login',
        component: () => import('@/components/Login.vue'), 
    },

    {
        path: '/register',
        name: 'Register',
        component: () => import('@/components/Register.vue'),
    },
];

const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),
    routes,
});

export default router;