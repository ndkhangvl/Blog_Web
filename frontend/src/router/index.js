import {createWebHistory, createRouter} from 'vue-router';
//import Home from "@view/Home.vue";

const routes = [
    {
        path:'/',
        name: 'Home',
        component: () => import('@/view/PostHome.vue'), 
    },
    {
        path: '/posts/:id',
        name: 'post.show',
        component: () => import('@/view/PostShow.vue'),
        props: (route) => ({ postId: parseInt(route.params.id) })
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

    {
        path: '/blogpost',
        name: 'Blog Post',
        component: () => import('@/components/StatusForm.vue'),
    },

];

const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),
    routes,
});

export default router;