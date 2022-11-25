<template>
    <div class="flex lg:max-w-4xl max-w-3xl lg:flex-grow mx-auto">
        <div
            class="lg:bg-white lg:w-1/2 lg:p-8 lg:py-16 lg:px-12 space-y-7 marlene-rounded-l-lg shadow-sm w-max p-8 marlene-bg-glass-ex mx-auto">
            <div class="space-y-3.5">
                <p class="mb-2 text-primary text-4xl text-center">Đăng Nhập</p>
            </div>
            <Form :validation-schema="formSchema" @submit="login">
                <div class="mb-6">
                    <label for="text" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Tên tài
                        khoản</label>
                    <Field type="text" name="username"
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                        placeholder="Nhập tên tài khoản" v-model="username" />
                    <ErrorMessage name="username" class="text-sm text-red-800" />
                </div>
                <div class="mb-6">
                    <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Mật
                        khẩu</label>
                    <Field type="password" name="password"
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                        placeholder="Nhập mật khẩu" v-model="password" />
                    <ErrorMessage name="password" class="text-sm text-red-800" />
                </div>
                <div class="col-end-8 col-span-3">
                    <a class="text-primary" href="">Đăng Nhập</a>
                    <a class=""> / </a>
                    <router-link to="/register" class="text-primary">Đăng Ký</router-link>
                </div>
                <div class="block text-center ">
                    <button
                        class="tracking-widest bg-primary min-w-full h-12 focus:bg-secondary hover:bg-secondary text-white rounded-lg text-2xl marlene-btn"
                        type="submit">Đăng Nhập</button>
                </div>
            </Form>
        </div>
    </div>
</template>
  
<script>
import * as yup from 'yup';
import { Form, Field, ErrorMessage } from 'vee-validate';
import { blogService } from '@/services/blog.service';
export default {
    data() {
        const formSchema = yup.object().shape({
            username: yup
                .string()
                .required('Tên tài khoản không thể trống.')
                .max(50, 'Tên tài khoản không quá 50 kí tự'),
            password: yup
                .string()
                .required('Mật khẩu không thể trống.')
                .min(6, 'Mật khẩu ít nhất 6 kí tự.'),
        });
        return ({
            username: "",
            password: "",
            error: "",
            formSchema
        })
    },
    methods: {

        async login() {
            try {
                const user = await blogService.signIn({
                    username: this.username,
                    password: this.password,
                });

                console.log("user", user);

            } catch (error) {
                console.log(error);
            }


        }
    },

    components: { Form, Field, ErrorMessage }
};
</script>
  
<style>

</style>