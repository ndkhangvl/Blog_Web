import {createWebHistory, createRouter} from 'vue-router';
//import Home from "@view/Home.vue";

const routes = [
    {
        path:'/',
        name: 'Home',
        component: () => import('@/view/Login.vue'), 
    },

    {
        path:'/login',
        name: 'Login',
        component: () => import('@/view/Login.vue'), 
    },

    {
        path: '/register',
        name: 'Register',
        component: () => import('@/view/Register.vue'),
    },
];

const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),
    routes,
});

export default router;